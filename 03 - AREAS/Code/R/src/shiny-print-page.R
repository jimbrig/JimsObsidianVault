library(shiny)
library(shinyjs)

jsCode <- 'shinyjs.winprint = function(){
window.print();
}'

ui <- shinyUI(fluidPage(
  useShinyjs(),
  extendShinyjs(text = jsCode),
  actionButton("print", "PRINT")
))



server <- shinyServer(function(input, output) {
  observeEvent(input$print, {
    js$winprint()
  })
})


shinyApp(ui, server)
