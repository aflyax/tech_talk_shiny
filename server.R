shinyServer(function(input, output) {
  output$raw_data = DT::renderDataTable(
    {
      print(dataset)
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
  
  output$data_plot <- renderPlot(
    {
      x_label = input$select_X[1]
      y_label = input$select_y
      
      x = dataset[, get(x_label)]      # for data.table
      y = dataset[, get(y_label)]
      
#       x = dataset[,x_label]         # for data.frame
#       y = dataset[,y_label]
      
      plot(x = x, y = y, xlab = x_label, ylab = y_label)
    }
  )
  
  output$model_text <- renderPrint({
    model <- get_model()
    summary(model)
  })
  
  
  output$coef_plot <- renderPlot(
    {
      input$plotButton
      
      if (input$plotButton == 0)
        return()
      
      isolate({
        model <- get_model()
        coefplot(model, xlab = input$select_y)
      })
    }
  )
  
  
  get_model <- reactive({
    formula_text = as.formula(paste(input$select_y, '~', paste(input$select_X, collapse = '+'), '-1'))
    print(formula_text)
    model = glm(formula = formula_text, data = dataset)
  })
  
})