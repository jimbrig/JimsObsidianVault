# https://gist.github.com/schochastics/5c5b2d153625c7e2e8bcf3ea7e874c3a

library(shiny)
library(grDevices)

xy <- grDevices::dev.size("px")

url <-
  "https://www.youtube.com/watch?v=Ef2jmf2vy00" #copy yt link here
url <- gsub("watch\\?v=", "embed/", url)
ui <- fluidPage(HTML(
  paste0(
    '<iframe width="',
    xy[1],
    '" height="',
    xy[2],
    '" src="',
    url,
    '" frameborder="0"></iframe>'
  )
))
server <- function(input, output, session) {

}

runGadget(shinyApp(ui, server, options = c(
  "launch.browser" = FALSE, "port" = 1111
)),
port = 1111,
viewer = paneViewer())
