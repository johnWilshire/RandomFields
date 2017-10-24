
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(geoR)

shinyServer(function(input, output) {
  grfO <- reactive({
    x <- as.numeric(input$x)
    y <- as.numeric(input$y) 
    print(input$kappa)
    grf(n = x * y, 
        grid = expand.grid(1:x, 1:y),
        cov.pars = as.numeric(c(input$cov_par1, input$cov_par2)),
        cov.model = input$covfun, 
        nugget = as.numeric(input$nugget)
    )
  })
  output$image <- renderPlot({

    # generate bins based on input$bins from ui.R
    # draw the histogram with the specified number of bins

    image(grfO())
  })
  output$vario <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    # draw the histogram with the specified number of bins
    
    plot(variog(grfO()))
  })

})
