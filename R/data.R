#' A relational data model of VISTA 2012 - 2018 public version.
#'
#' @description
#'
#' A [dm::dm()] object containing six tables.
#'
#' @format A [dm::dm()] object containing 6 tables:
#' \describe{
#'   \item{persons}{Person-level data - ID columns: persid(PK), hhid.}
#'   \item{households}{Household-level data - ID columns: hhid(PK).}
#'   \item{trips}{Trips - ID columns: tripid(PK), persid, hhid.}
#'   \item{stops}{Trips' stops - ID columns: persid(PK), hhid.}
#'   \item{jtw}{journey to work - ID columns: jtwid(PK), persid, hhid.}
#'   \item{jte}{journey to education - ID columns: jtwid(PK), persid, hhid.}
#' }
#' @source \url{https://transport.vic.gov.au/about/data-and-research/vista/vista-data-and-publications}
"vista_dm"
