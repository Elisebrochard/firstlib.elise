test_that("plot_distribution_semaine renvoie un ggplot", {
  df <- data.frame(
    `Probabilité de présence d'anomalies` = c(NA, NA, NA),
    `Jour de la semaine` = c("1", "2", "3"),
    Total = c(10, 20, 30),
    check.names = FALSE
  )

  p <- plot_distribution_semaine(df)

  expect_s3_class(p, "ggplot")
})

