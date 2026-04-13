test_that("compter_nombre_boucle compte correctement les boucles distinctes", {
  df <- data.frame(
    `Numéro de boucle` = c("A", "A", "B", "C"),
    check.names = FALSE
  )

  expect_equal(compter_nombre_boucle(df), 3)
})

