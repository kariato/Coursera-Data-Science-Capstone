


function(input, output, session) {
  # Define a reactive expression for the word search
  terms <- reactive({
   
    input$txt
    })


  # Make the wordcloud drawing predictable during a session
  wordcloud_rep <- repeatable(wordcloud)
  
    #get the top word
    output$topword <- renderText(getTextAnswer(input$txt))

    #plot the word cloud
    output$plot <- renderPlot({
      result <- getCloudAnswer(input$txt)
      wordcloud_rep(result$suggestion, result$COUNT, scale=c(4,2),
                  max.words=input$max,
                  colors=brewer.pal(8, "Dark2"))
  })
}
