#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library('networkBMA')
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("CSE-609 Project Demo"),
  br(), 
  h2('Fast Bayesian inference for gene regulatory networks using ScanBMA'),
  br(), 
  h3('Group Members: '),
  h4('Divyanshu Srivastava (MT16125), Vaibhav Tripathi (MT16129)'),
  br(),
  
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       selectInput("select", h3("Select the network"), 
                   choices = list("Network 1" = 1, "Network 2" = 2,
                                  "Network 3" = 3, "Network 4" = 4, 
                                  "Network 5" = 5), selected = 1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
