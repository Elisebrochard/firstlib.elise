test_that("filtre_anomalie retire bien les anomalies", {
  df <- data.frame(
    `Probabilité de présence d'anomalies` = c(NA, 0.2, NA),
    x = 1:3,
    check.names = FALSE
  )

  res <- filtre_anomalie(df)

  expect_equal(nrow(res), 2)
  expect_true(all(is.na(res$`Probabilité de présence d'anomalies`)))
})

