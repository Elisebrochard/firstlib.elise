#' Filtrer les trajets selon les boucles selectionnees
#'
#' Cette fonction filtre un data.frame contenant des comptages velo
#' pour ne conserver que les lignes correspondant aux boucles indiquees.
#'
#' @param trajet data.frame. Le jeu de donnees contenant les comptages.
#' @param boucle character. Un vecteur de numeros de boucle a conserver.
#'
#' @return Un data.frame filtre contenant uniquement les boucles selectionnees.
#'
#' @examples
#' filtrer_trajet(trajet = df_velo, boucle = c("880", "881"))
#'
#' @export
filtrer_trajet <- function(trajet, boucle) {
  dplyr::filter(trajet, `Numéro de boucle` %in% boucle)
}

