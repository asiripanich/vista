#' Download VISTA 2012-2018
#'
#' @description
#' This function downloads the public version of VISTA 2012-2018
#' and read them into R as a list of data.frames.
#'
#' @param url url to a VISTA 2012-2018 zip file.
#' @return a list of data.frames.
#'
#' @source \url{https://transport.vic.gov.au/about/data-and-research/vista/vista-data-and-publications}
#'
#' @export
#' @examples
#' get_vista18()
get_vista18 <- function(url = "https://transport.vic.gov.au/-/media/tfv-documents/vista-12-18-260321.zip?la=en&hash=F39F3E513D07610B1C58A1BD2260FADF") {
  temp <- tempfile() # a temporary file to save the downloaded data
  httr::GET(
    url,
    httr::user_agent("Mozilla/5.0"),
    httr::write_disk(temp, overwrite = TRUE)
  )

  temp2 <- tempfile() # a temporary file to extract the downloaded data
  zip_info <- unzip(zipfile = temp, exdir = temp2)

  persons <-
    smart_read(path = grep("P_VISTA", zip_info, value = TRUE))

  households <-
    smart_read(path = grep("H_VISTA", zip_info, value = TRUE))

  trips <-
    smart_read(path = grep("T_VISTA", zip_info, value = TRUE))

  stops <-
    smart_read(path = grep("S_VISTA", zip_info, value = TRUE))

  jte <-
    smart_read(path = grep("JTE_VISTA", zip_info, value = TRUE))

  jtw <-
    smart_read(path = grep("JTW_VISTA", zip_info, value = TRUE))

  list(
    persons = persons,
    households = households,
    trips = trips,
    stops = stops,
    jte = jte,
    jtw = jtw
  ) %>%
    lapply(., function(x) janitor::clean_names(x))
}

smart_read <- function(path) {
  # if ends with csv
  if (grepl(".csv$", path)) {
    return(read.csv(path))
  }
  if (grepl(".xlsx$", path)) {
    return(readxl::read_xlsx(path, sheet = 1))
  }
  stop("Don't know how to read this file: ", path, call. = FALSE)
}
