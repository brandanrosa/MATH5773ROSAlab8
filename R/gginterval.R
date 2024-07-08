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
#'
#' @examples {gginterval(epoxy, alpha = 0.05)}
gginterval <- function(df, alpha = 0.05) {

  `EXP-TIME` <- c()
  CORRATE <- c()

  dflm <- lm(CORRATE ~ SYSTEM + `EXP-TIME`, data = df)
  beta <- as.matrix(coef(dflm))
  dfci <- confint(dflm, level = 1-alpha)

  p <- ggplot(df, aes(x = `EXP-TIME`, y = CORRATE, fill = `EXP-TIME`)) +
    geom_boxplot() + geom_point()

  list(beta_estimates=beta, Conf_Ints=dfci, plot=p)
}
