#' myRebase
#'
#' A function which will rebase a data frame's factors
#'
#' @param df a data frame
#' @param SYSTEM_base new base for System
#' @param EXP_base new base for Exptime
#'
#' @return a data frame with rebased levels of factors
#' @export
#'
#' @importFrom magrittr %>%
#' @importFrom dplyr mutate
#' @importFrom stats relevel
#'
#' @examples \dontrun{myRebase(epoxy, 2, 60)}
myRebase <- function(df, SYSTEM_base, EXP_base) {

  SYSTEM <- c()
  EXPTIME <- c()

  sb <- as.character(SYSTEM_base)
  eb <- as.character(EXP_base)

  df2 <- df %>%
    mutate(SYSTEM = relevel(SYSTEM, sb),
           EXPTIME = relevel(EXPTIME, eb))
}
