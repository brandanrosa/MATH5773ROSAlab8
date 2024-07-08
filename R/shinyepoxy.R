#' shinyepoxy
#'
#' An interactive app with sliders to rebase the levels of the independent variables
#'
#' @return a plot of histograms and a list of confidence intervals
#' @export
#'
#' @importFrom shiny runApp
#'
#' @examples \dontrun{shinyboots()}
shinyepoxy <- function() {
  runApp(system.file("shinyepoxy",
                     package = "MATH5773ROSAlab8"),
         launch.browser = TRUE)
}
