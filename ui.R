
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Random Fields Explorer"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("x", "X range", 
                  c(50, 100, 200), selected = 3),
      selectInput("y", "Y range", 
                  c(50, 100, 200), selected = 3),
      sliderInput("cov_par1", value = 1, min = 0.1, max = 10, label = "Covariance model parameter 1 (variance) sigma^2"),
      sliderInput("cov_par2", value = 1, min = 0.1, max = 10, label = "Covariance model parameter 2 (range) phi"),
      selectInput("covfun", "Covariance Function", 
                  c("matern", "spherical", "gaussian"), selected = 0),
      selectInput("nugget", "Nugget effect",
               c(0, 0.5, 1, 3, 1e10), selected = 0)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("image", height = "500px"),
      plotOutput("vario", height = "500px")
    )
  )
))
