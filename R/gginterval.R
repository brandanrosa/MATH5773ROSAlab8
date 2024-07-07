#' gginterval
#'
#' A function which produces a ggplot and a list of confidence intervals for the rebased data
#'
#' @param df data frame
#' @param alpha alpha level
#'
#' @return a ggplot and named list of confidence intervals
#' @export
#'
#' @importFrom ggplot2 ggplot geom_boxplot geom_point aes
#' @importFrom stats coef confint lm
#' @importFrom magrittr %>%
#'
#' @examples \dontrun{gginterval(epoxy, alpha = 0.05)}
gginterval <- function(df, alpha = 0.05) {

  EXPTIME <- c()
  CORRATE <- c()

  dflm <- lm(CORRATE ~ SYSTEM + EXPTIME, data = df)
  beta <- as.matrix(coef(dflm))
  dfci <- confint(dflm, level = 1-alpha)

  df %>%
    ggplot(aes(x = EXPTIME, y = CORRATE, fill = EXPTIME)) +
    geom_boxplot() + geom_point()

  list(beta_estimates=beta, Conf_Ints=dfci)
}
