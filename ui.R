shinyUI(fluidPage(
  headerPanel(
    'Shiny Tech Talk'
  ),
  sidebarPanel('sidebar',
               selectizeInput(inputId = 'select_X',
                              label = 'please select X',
                              choices = names(dataset),
                              select = names(dataset)[1:2],
                              multiple = TRUE
               )
               
               
               
               
               
  ),
  
  
  
  
  mainPanel('mainbar')
  
)
)