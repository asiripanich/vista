## code to prepare `DATASET` dataset goes here

library(dm)
library(readxl)
library(readr)
library(janitor)

#' link to download the 2012-2018 Victoria household travel survey
#' as found on https://transport.vic.gov.au/about/data-and-research/vista/vista-data-and-publications
# url <- "https://transport.vic.gov.au/-/media/tfv-documents/vista-12-18-260321.zip?la=en&hash=F39F3E513D07610B1C58A1BD2260FADF"
# temp <- tempfile() # a temporary file to save the downloaded data
temp2 <- tempfile() # a temporary file to extract the downloaded data
zip_info <- unzip(zipfile = here::here("data-raw", "VISTA 12-18-260321.zip"), exdir = temp2)

persons <-
  readxl::read_xlsx(
    path = grep("P_VISTA", zip_info, value = TRUE),
    sheet = 1
  ) %>% janitor::clean_names()

households <-
  readr::read_csv(file = grep("H_VISTA", zip_info, value = TRUE)) %>%
  janitor::clean_names()

trips <-
  readr::read_csv(file = grep("T_VISTA", zip_info, value = TRUE)) %>%
  janitor::clean_names()

stops <-
  readr::read_csv(file = grep("S_VISTA", zip_info, value = TRUE)) %>%
  janitor::clean_names()

jte <-
  readr::read_csv(file = grep("JTE_VISTA", zip_info, value = TRUE)) %>%
  janitor::clean_names()

jtw <-
  readr::read_csv(file = grep("JTW_VISTA", zip_info, value = TRUE)) %>%
  janitor::clean_names()

vista_dm <-
  vista_to_dm(persons, households, trips, stops, jte, jtw)

usethis::use_data(vista_dm, overwrite = TRUE)
