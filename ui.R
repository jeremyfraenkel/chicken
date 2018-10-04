library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Find out how much a Chicken weighs?"),
  
  # Sidebar with input on Chicken 
  sidebarLayout(
    sidebarPanel(
      helpText("Chicken's weight depends on the number of days since birth and his diet:"),
      radioButtons('Time', 'How many days have gone by since birth?', choices = c(0,2,4,6,8,10,12,14,16,18,20,21)),
      sliderInput('Diet', 'What type of diet is the chicken on?', 1, min = 1, max = 4, step = 1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("plot1"),
       h2('The predicted weight of the chicken is (gm):'),
       textOutput("pred1")
    )
  )
))
