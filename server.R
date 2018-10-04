library(shiny)

shinyServer(function(input, output) {
  model1 <- lm(weight~factor(Diet)+factor(Time),data=ChickWeight)
  model1pred <- reactive({
    round(predict(model1, newdata = data.frame(Time = input$Time, Diet = input$Diet)),0)
  })
  output$pred1 <- renderText({
    model1pred()
  })
    output$plot1 <- renderPlot({
      T <- factor(input$Time, levels = c(0,2,4,6,8,10,12,14,16,18,20,21))
      par(xpd=T, mar = c(5,7,7,2))
      boxplot(ChickWeight$weight~ChickWeight$Time, main = "Plot of Time vs Weight", xlab = "Days", ylab = "Weight")
      legend(-2,500, legend = c("Diet1","Diet2","Diet3","Diet4"), y.intersp = 0.8,cex = 0.9, bty="n", col = c("red", "blue", "green", "yellow"), pch =8)
      if(input$Diet == 1){
        points(T, model1pred(), col = "red", cex = 3, pch = 8)
      } else if (input$Diet == 2){
        points(T, model1pred(), col = "blue", cex = 3, pch = 8)
      } else if (input$Diet == 3){
        points(T, model1pred(), col = "green", cex = 3, pch = 8)
      } else{
        points(T, model1pred(), col = "yellow", cex = 3, pch = 8)
      }
            })
  })
