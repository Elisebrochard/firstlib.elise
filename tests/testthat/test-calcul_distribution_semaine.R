test_that("calcul_distribution_semaine calcule correctement les trajets par jour", {
  df <- data.frame(
    `Jour de la semaine` = c("1", "1", "2"),
    Total = c(10, 20, 30),
    check.names = FALSE
  )

  res <- calcul_distribution_semaine(df)

  expect_equal(nrow(res), 2)
  expect_equal(res$trajets[res$`Jour de la semaine` == "1"], 30)
  expect_equal(res$trajets[res$`Jour de la semaine` == "2"], 30)
})

