test_that("compter_nombre_trajets calcule correctement la somme", {
  df <- data.frame(
    Total = c(1, 2, 3, 4, 5),
    check.names = FALSE
  )

  expect_equal(compter_nombre_trajets(df), 15)
})


