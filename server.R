#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# required by the project

library('networkBMA')
data("dream4")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    network <- as.integer(input$select)
    
    nTimePoints <- length(unique(dream4ts10[[network]]$time))
    edges1ts10 <- networkBMA(data = dream4ts10[[network]][,-(1:2)], 
                              nTimePoints = nTimePoints, prior.prob = 0.01)
    
    ref <- dream4gold10[[network]][which(dream4gold10[[1]]$edge == 1), c(1,2)]
    
    reference <- dream4gold10[[network]]
    nGenes <- length(unique(c(reference[,1],reference[,2])))
    nPossibleEdges <- nGenes^2
    size <- nPossibleEdges
    
    roc(contabs(edges1ts10, ref, size = size))
  })
  
})
