shinyUI(fluidPage(
  headerPanel(
    'Shiny Tech Talk'
  ),
  sidebarPanel('sidebar',
    selectizeInput(inputId = 'select_X',
                  label = 'please select X',
                  choices = names(dataset),
                  select = names(dataset)[1:2],
                  multiple = TRUE,
                  options = list(
                    plugins = list('remove_button', 'drag_drop')
                  )
    )
    
    , selectizeInput(inputId = 'select_y',
                     label = 'please select y',
                     select = 'depth',
                     choices = names(dataset),
                     multiple = FALSE)
  ),
  
  mainPanel('mainbar',
    tabsetPanel(
      tabPanel(inputId = 'raw_data',
               title = 'raw data',
               dataTableOutput('raw_data')
      ),
      
      tabPanel(inputId = 'selected_data',
               title = 'selected data',
               dataTableOutput('selected_data')
      ),
      
      tabPanel(inputId = 'data_plot',
               title = 'plot data',
               plotOutput('data_plot')
      ),
      
      tabPanel(inputId = 'model_output',
               title = 'model output',
               verbatimTextOutput("model_text")
      ),
      
      tabPanel(inputId = 'model_plot',
               title = 'model plot',
               actionButton(inputId = 'plotButton', label='plot'),
               plotOutput('coef_plot')
      )
    )
  )
  
)
)