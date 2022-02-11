test_that("vista works!", {
  vista18 <- get_vista18()
  checkmate::expect_list(vista18, types = "data.frame")
  for (df in vista18) {
    checkmate::assert_data_frame(df, min.rows = 1, min.cols = 1, all.missing = FALSE)
  }
  
  vista18_dm <- vista_to_dm(
    persons = vista18$persons,
    households = vista18$households,
    trips = vista18$trips,
    stops = vista18$stops,
    jte = vista18$jte,
    jtw = vista18$jtw
  )
  checkmate::expect_class(vista18_dm, "dm")
})