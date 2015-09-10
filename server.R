shinyServer(function(input, output) {
  output$raw_data = DT::renderDataTable(
    {
      dataset
    }
    , options = list(orderClasses = TRUE)
    , rownames = FALSE
    , filter = 'top'
  )
  
  
  
  
})