#' Filtrer les anomalies
#'
#' @description
#' Cette fonction retire les observations considérées comme anormales
#'
#' @param trajet Un data frame contenant les trajets
#' @return Un data frame sans les observations anormales
#'
#'@importFrom dplyr filter
#'
#' @export

filtre_anomalie <- function(trajet){
  trajet |>
    filter(is.na(`Probabilité de présence d'anomalies`))
}

#' Compter le nombre total de trajets
#'
#' @description
#' Cette fonction compte le nombre total de trajets dans un data.frame
#'
#' @param trajet Un data.frame contenant les trajets
#' @return Un entier le nombre total de trajets
#'
#' @import dplyr
#'
#' @export


compter_nombre_trajets <- function(trajet){
  trajet |>
    pull(Total) |>
    sum()
}

#' Compter le nombre de boucle
#'
#' @description
#' Cette fonction compte le nombre total de boucle
#'
#' @param trajet Un data.frame contenant les trajets
#' @return Un data.frame avec deux colonnes
#'
#' @import dplyr
#'
#' @export

compter_nombre_boucle <- function(trajet){
  trajet |>
    pull(`Numéro de boucle`) |>
    n_distinct()
}

#' Trouver le trajet max
#'
#' @description
#' Cette fonction trouve la boucle ayant enregistrée le plus grand nombre de passages
#'
#' @param trajet Un data.frame contenant les trajets
#' @return Un data.frame avec une ligne
#'
#' @import dplyr
#'
#' @export


trouver_trajet_max <- function(trajet){
  trajet |>
    slice_max(Total) |>
    select(`Boucle de comptage`, Jour, Total)
}

#' Calculer la distribution par jour de la semaine
#'
#' @description
#' Cette fonction calcule le nombre total de trajets par jour
#'
#' @param trajet Un data.frame contenant les trajets
#' @return Un data.frame avec une ligne pour chaque jour
#'
#' @import dplyr
#'
#' @export


calcul_distribution_semaine <- function(trajet){
  trajet |>
    count(`Jour de la semaine`, wt = Total, sort = TRUE, name = "trajets")
}


#' Faire une graphique de la distribution par jour de la semaine
#'
#' @description
#' Cette fonction calcule le nombre total de trajets par jour
#'
#' @param trajet Un data.frame contenant les trajets
#' @return Un graphique représentant la distibrution par jour
#'
#' @import dplyr
#' @importFrom ggplot2 ggplot aes geom_col
#' @importFrom forcats fct_recode
#'
#' @export

plot_distribution_semaine <- function(trajet) {
  trajet_weekday <- trajet |>
    filtre_anomalie() |>
    calcul_distribution_semaine() |>
    mutate(
      jour = forcats::fct_recode(
        factor(`Jour de la semaine`),
        "lundi" = "1",
        "mardi" = "2",
        "mercredi" = "3",
        "jeudi" = "4",
        "vendredi" = "5",
        "samedi" = "6",
        "dimanche" = "7"
      )
    )

  ggplot(trajet_weekday) +
    aes(x = jour, y = trajets) +
    geom_col()
}
