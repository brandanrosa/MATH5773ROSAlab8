library(shiny)
library(ggplot2)

sys <- c("System 1", "System 2", "System 3", "System 4")
time <- c("1 Day", "60 Days", "120 Days")

#############################################################################
# Define UI for application that draws a histogram
ui <- fluidPage(
  theme = bslib::bs_theme(bootswatch = "darkly"),

  # title
  titlePanel("Rebasing and Boxplotting"),

  # Sidebar
  sidebarLayout(
    sidebarPanel(
      selectInput("treat", "Epoxy Coating System Base: ", sys),
      selectInput("block", "Exposure Time Base: ", time),
      sliderInput("alpha",
                  "alpha",
                  min = 0,
                  max = 0.25,
                  value = 0.05,
                  step = 0.05)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("plot"),
      tableOutput("tab"),
      textOutput("title"),
      verbatimTextOutput("lm")
    )
  )
)

# server
server <- function(input, output, session) {

  dfr <- reactive({
    myrebase(epoxy, SYSTEM_base = input$treat, EXP_base = input$block)
  })

  output$plot <- renderPlot({
     gginterval(dfr())
  })

  output$tab <- renderTable({
  })

  output$title <- renderText({
    sprintf("%s, %s",
            input$treat,
            input$block)
  })

  output$lm <- renderPrint({
    ylm <- lm(CORRATE ~ SYSTEM + `EXP-TIME`, data = dfr())
    confint(ylm)
  })

}

# Run the application
shinyApp(ui = ui, server = server)
