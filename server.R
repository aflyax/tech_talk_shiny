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
#       print('ehllo')
      print(input$select_X)
      dataset[, match(input$select_X, names(dataset)), with=F]
    }
    , options = list(orderClasses = TRUE)
    , rownames = FALSE
    , filter = 'top'
  ) 
  
  
})