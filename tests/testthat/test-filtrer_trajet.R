test_that("filtrer_trajet filtre correctement les boucles", {
  df <- data.frame(
    `Numéro de boucle` = c("880", "881", "882"),
    x = 1:3,
    check.names = FALSE
  )

  res <- filtrer_trajet(df, NULL)

  expect_equal(res, df)
})


