shinyServer(function(input, output) {
  output$raw_data = DT::renderDataTable(
    {
      dataset
    }
    , options = list(orderClasses = TRUE)
    , rownames = FALSE
    , filter = 'top'
  )
  
  output$selected_data = DT::renderDataTable(
    {
      dataset[, match(unique(c(input$select_X,input$select_y)),
                      names(dataset)),
              with=F]
    }
    , options = list(orderClasses = TRUE)
    , rownames = FALSE
    , filter = 'top'
  )
  
  
})