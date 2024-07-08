#' myrebase
#'
#' A fuction which will rebase the levels of the varibles of the `EPOXY` data set
#'
#' @param df data frame `Epoxy`
#' @param SYSTEM_base rebase level for `SYSTEM` variable
#' @param EXP_base rebase level for ``EXP-TIME`` variable
#'
#' @return a rebased data frame
#' @export
#'
#' @examples {myrebase(epoxy, 2, 60)}
myrebase <- function(df, SYSTEM_base, EXP_base) {

  df <- within(df, {
    `EXP-TIME` <- factor(`EXP-TIME`)
    SYSTEM <- factor(SYSTEM)})

  ifelse(SYSTEM_base == "2", levels(df$SYSTEM) <- c("2", "1", "3", "4"),
         ifelse(SYSTEM_base == "3", levels(df$SYSTEM) <- c("3", "1", "2", "4"),
                ifelse(SYSTEM_base == "4", levels(df$SYSTEM) <- c("4", "1", "2", "3"),
                       levels(df$SYSTEM) <- c("1", "2", "3", "4"))))

  ifelse(EXP_base == "60", levels(df$`EXP-TIME`) <- c("60", "1", "120"),
         ifelse(EXP_base == "120", levels(df$`EXP-TIME`) <- c("120", "1", "60"),
                levels(df$`EXP-TIME`) <- c("1", "60", "120")))

  dfr <- df
  dfr
}
