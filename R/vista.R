#' Convert VISTA tables to a {dm} object.
#'
#' @description
#'
#' This function turn tables from VISTA into a relational
#' data model, a [dm::dm()] object.
#'
#' @param persons A 'persons' table from VISTA.
#' @param households A 'households' table from VISTA.
#' @param trips A 'trips' table from VISTA.
#' @param stops A 'stops' table from VISTA.
#' @param jte A 'jte' table from VISTA.
#' @param jtw A 'jtw' table from VISTA.
#'
#' @return a [dm::dm()] object containing all the six tables
#'  with keys that link them.
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
#' @export
#' @examples
#' vista18 <- get_vista18()
#' vista18_dm <- vista_to_dm(
#'   persons = vista18$persons,
#'   households = vista18$households,
#'   trips = vista18$trips,
#'   stops = vista18$stops,
#'   jte = vista18$jte,
#'   jtw = vista18$jtw
#' )
vista_to_dm <- function(persons, households, trips, stops, jte, jtw) {
  persons <- assert_data_frame(persons) %>% janitor::clean_names()
  households <- assert_data_frame(households) %>% janitor::clean_names()
  trips <- assert_data_frame(trips) %>% janitor::clean_names()
  stops <- assert_data_frame(stops) %>% janitor::clean_names()
  jte <- assert_data_frame(jte) %>% janitor::clean_names()
  jtw <- assert_data_frame(jtw) %>% janitor::clean_names()

  vista_dm <-
    dm(persons, households, trips, stops, jte, jtw) %>%
    dm_add_pk(persons, persid) %>%
    dm_add_pk(households, hhid) %>%
    dm_add_pk(trips, tripid) %>%
    dm_add_pk(stops, persid) %>%
    dm_add_pk(jte, jteid) %>%
    dm_add_pk(jtw, jtwid) %>%
    dm_add_fk(persons, persid, trips, persid) %>%
    dm_add_fk(persons, hhid, households) %>%
    dm_add_fk(persons, persid, stops) %>%
    dm_add_fk(persons, persid, jte, persid) %>%
    dm_add_fk(persons, persid, jtw, persid)
}
