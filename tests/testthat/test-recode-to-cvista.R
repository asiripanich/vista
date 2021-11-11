test_that("recode to cvista", {
    expect_snapshot({
        vista_persons_and_households <- vista_dm %>%
            dm_select_tbl(persons, households) %>%
            dm_squash_to_tbl(persons) %>%
            collect() %>%
            data.table::setDT()
        out <- vista_to_cvista(vista_persons_and_households)

        out

        cvista_cols <- grep("^cvista_", names(out), value = TRUE)
        cvista_cols

        values <- lapply(cvista_cols, function(col) {
            unique(out[[col]])
        })
        values
    })
})
