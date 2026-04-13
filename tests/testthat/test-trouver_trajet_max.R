test_that("trouver_trajet_max renvoie la ligne max", {
  df <- data.frame(
    `Boucle de comptage` = c("A", "B", "C"),
    Jour = c("Lun", "Mar", "Mer"),
    Total = c(10, 50, 30),
    check.names = FALSE
  )

  res <- trouver_trajet_max(df)

  expect_equal(res$`Boucle de comptage`, "B")
  expect_equal(res$Total, 50)
})

