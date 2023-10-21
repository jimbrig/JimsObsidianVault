library(shiny)
library(shinydashboard)

valueBox2 <- function(value, title, subtitle, icon = NULL, color = "aqua", width = 4, href = NULL){

  shinydashboard:::validateColor(color)

  if (!is.null(icon))
    shinydashboard:::tagAssert(icon, type = "i")

  boxContent <- div(
    class = paste0("small-box bg-", color),
    div(
      class = "inner",
      tags$small(title),
      h3(value),
      p(subtitle)
    ),
    if (!is.null(icon)) div(class = "icon-large", icon)
  )

  if (!is.null(href))
    boxContent <- a(href = href, boxContent)

  div(
    class = if (!is.null(width)) paste0("col-sm-", width),
    boxContent
  )
}

vb <- valueBox2(
  value = "1,345",
  title = toupper("Lines of code"),
  subtitle = tagList(HTML("&uarr;"), "25% Since last day"),
  icon = icon("code"),
  width = 4,
  color = "red",
  href = NULL
)

set.seed(123)

N <- 20

x <- cumsum(rnorm(N)) + 0.5 * cumsum(runif(N))
x <- round(200*x)

df <- data.frame(
  x = sort(as.Date(Sys.time() - lubridate::days(1:N))),
  y = abs(x)
)

df


library(highcharter)

hc <- hchart(df, "line", hcaes(x, y), name = "lines of code")  %>%
  hc_size(height = 100)

hc

valueBox3 <- function(value, title, sparkobj = NULL, subtitle, icon = NULL,
                      color = "aqua", width = 4, href = NULL){

  shinydashboard:::validateColor(color)

  if (!is.null(icon))
    shinydashboard:::tagAssert(icon, type = "i")

  boxContent <- div(
    class = paste0("small-box bg-", color),
    div(
      class = "inner",
      tags$small(title),
      h3(value),
      if (!is.null(sparkobj)) sparkobj,
      p(subtitle)
    ),
    if (!is.null(icon)) div(class = "icon-large", icon, style = "z-index; 0")
  )

  if (!is.null(href))
    boxContent <- a(href = href, boxContent)

  div(
    class = if (!is.null(width)) paste0("col-sm-", width),
    boxContent
  )
}

vb <- valueBox3(
  value = "1,345",
  title = toupper("Lines of code"),
  sparkobj = hc,
  subtitle = tagList(HTML("&uarr;"), "25% Since last day"),
  icon = icon("code"),
  width = 4,
  color = "red",
  href = NULL)

hc_theme_sparkline_vb <- function(...) {

  theme <- list(
    chart = list(
      backgroundColor = NULL,
      margins = c(0, 0, 0, 0),
      spacingTop = 0,
      spacingRight = 0,
      spacingBottom = 0,
      spacingLeft = 0,
      plotBorderWidth = 0,
      borderWidth = 0,
      style = list(overflow = "visible")
    ),
    xAxis = list(
      visible = FALSE,
      endOnTick = FALSE,
      startOnTick = FALSE
    ),
    yAxis = list(
      visible = FALSE,
      endOnTick = FALSE,
      startOnTick = FALSE
    ),
    tooltip = list(
      outside = FALSE,
      shadow = FALSE,
      borderColor = "transparent",
      botderWidth = 0,
      backgroundColor = "transparent",
      style = list(textOutline = "5px white")
    ),
    plotOptions = list(
      series = list(
        marker = list(enabled = FALSE),
        lineWidth = 2,
        shadow = FALSE,
        fillOpacity = 0.25,
        color = "#FFFFFFBF",
        fillColor = list(
          linearGradient = list(x1 = 0, y1 = 1, x2 = 0, y2 = 0),
          stops = list(
            list(0.00, "#FFFFFF00"),
            list(0.50, "#FFFFFF7F"),
            list(1.00, "#FFFFFFFF")
          )
        )
      )
    ),
    credits = list(
      enabled = FALSE,
      text = ""
    )
  )

  theme <- structure(theme, class = "hc_theme")

  if (length(list(...)) > 0) {
    theme <- hc_theme_merge(
      theme,
      hc_theme(...)
    )
  }

  theme
}

hc <- hc %>%
  hc_add_theme(hc_theme_sparkline_vb()) %>%
  hc_credits(enabled = FALSE)

hc %>%
  # emulate the background color of the valueBox
  hc_chart(backgroundColor = "#DD4B39")

vb <- valueBox3(
  value = "1,345",
  title = toupper("Lines of code"),
  sparkobj = hc,
  subtitle = tagList(HTML("&uarr;"), "25% Since last day"),
  icon = icon("code"),
  width = 4,
  color = "red",
  href = NULL)


valueBox4 <- function(value, title, sparkobj = NULL, subtitle, info = NULL,
                      icon = NULL, color = "aqua", width = 4, href = NULL){

  shinydashboard:::validateColor(color)

  if (!is.null(icon))
    shinydashboard:::tagAssert(icon, type = "i")

  info_icon <- tags$small(
    tags$i(
      class = "fa fa-info-circle fa-lg",
      title = info,
      `data-toggle` = "tooltip",
      style = "color: rgba(255, 255, 255, 0.75);"
    ),
    class = "pull-right"
  )

  boxContent <- div(
    class = paste0("small-box bg-", color),
    div(
      class = "inner",
      tags$small(title),
      if (!is.null(sparkobj)) info_icon,
      h3(value),
      if (!is.null(sparkobj)) sparkobj,
      p(subtitle)
    ),
    if (!is.null(icon)) div(class = "icon-large", icon, style = "z-index; 0")
  )

  if (!is.null(href))
    boxContent <- a(href = href, boxContent)

  div(
    class = if (!is.null(width)) paste0("col-sm-", width),
    boxContent
  )
}


vb <- valueBox4(
  value = "1,345",
  title = toupper("Lines of code"),
  sparkobj = hc,
  subtitle = tagList(HTML("&uarr;"), "25% Since last day"),
  info = "This is the lines of code I've written in the past 20 days! That's a lot, right?",
  icon = icon("code"),
  width = 4,
  color = "red",
  href = NULL
)

valueBoxSpark <- function(value, title, sparkobj = NULL, subtitle, info = NULL,
                          icon = NULL, color = "aqua", width = 4, href = NULL){

  shinydashboard:::validateColor(color)

  if (!is.null(icon))
    shinydashboard:::tagAssert(icon, type = "i")

  info_icon <- tags$small(
    tags$i(
      class = "fa fa-info-circle fa-lg",
      title = info,
      `data-toggle` = "tooltip",
      style = "color: rgba(255, 255, 255, 0.75);"
    ),
    # bs3 pull-right
    # bs4 float-right
    class = "pull-right float-right"
  )

  boxContent <- div(
    class = paste0("small-box bg-", color),
    div(
      class = "inner",
      tags$small(title),
      if (!is.null(sparkobj)) info_icon,
      h3(value),
      if (!is.null(sparkobj)) sparkobj,
      p(subtitle)
    ),
    # bs3 icon-large
    # bs4 icon
    if (!is.null(icon)) div(class = "icon-large icon", icon, style = "z-index; 0")
  )

  if (!is.null(href))
    boxContent <- a(href = href, boxContent)

  div(
    class = if (!is.null(width)) paste0("col-sm-", width),
    boxContent
  )
}


hc <- hchart(df, "area", hcaes(x, y), name = "lines of code")  %>%
  hc_size(height = 100) %>%
  hc_credits(enabled = FALSE) %>%
  hc_add_theme(hc_theme_sparkline_vb())

hc2 <- hchart(df, "line", hcaes(x, y), name = "Distance")  %>%
  hc_size(height = 100) %>%
  hc_credits(enabled = FALSE) %>%
  hc_add_theme(hc_theme_sparkline_vb())

hc3 <- hchart(df, "column", hcaes(x, y), name = "Daily amount")  %>%
  hc_size(height = 100) %>%
  hc_credits(enabled = FALSE) %>%
  hc_add_theme(hc_theme_sparkline_vb())

vb <- valueBoxSpark(
  value = "1,345",
  title = toupper("Lines of code written"),
  sparkobj = hc,
  subtitle = tagList(HTML("&uarr;"), "25% Since last day"),
  info = "This is the lines of code I've written in the past 20 days! That's a lot, right?",
  icon = icon("code"),
  width = 4,
  color = "teal",
  href = NULL
)

vb2 <- valueBoxSpark(
  value = "1,345 KM",
  title = toupper("Distance Traveled"),
  sparkobj = hc2,
  subtitle = tagList(HTML("&uarr;"), "25% Since last month"),
  info = "This is the lines of code I've written in the past 20 days! That's a lot, right?",
  icon = icon("plane"),
  width = 4,
  color = "red",
  href = NULL
)

vb3 <- valueBoxSpark(
  value = "1,3 Hrs.",
  title = toupper("Thinking time"),
  sparkobj = hc3,
  subtitle = tagList(HTML("&uarr;"), "5% Since last year"),
  info = "This is the lines of code I've written in the past 20 days! That's a lot, right?",
  icon = icon("hourglass-half"),
  width = 4,
  color = "yellow",
  href = NULL
)

library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    fluidRow(
      valueBoxOutput("vbox"),
      valueBoxOutput("vbox2"),
      valueBoxOutput("vbox3")
    )
  )
)

server <- function(input, output) {
  output$vbox <- renderValueBox(vb)
  output$vbox2 <- renderValueBox(vb2)
  output$vbox3 <- renderValueBox(vb3)
}

shiny::shinyApp(ui, server, options = list(launch.browser = .rs.invokeShinyPaneViewer))


library(bs4Dash)

ui <- bs4DashPage(
  navbar = bs4DashNavbar(),
  sidebar = bs4DashSidebar(disable = TRUE),
  body = bs4DashBody(
    # this is for use tooltips in the bs4dash package
    tags$script(HTML("setInterval(function(){ $('[title]').tooltip(); }, 1000)")),
    tags$h2("Testing with {bs4dash} package"),
    tags$hr(),
    fluidRow(
      valueBoxOutput("vbox"),
      valueBoxOutput("vbox2"),
      valueBoxOutput("vbox3")
    )
  )
)

# setTimeout(function(){ $('[title]').tooltip(); }, 3000)
# setInterval(function(){ $('[title]').tooltip(); }, 3000)
# JS("$(function () { $('[title]').tooltip() })")

shinyApp(ui, server)

value_box_spark <- function(value,
                            title,
                            sparkobj = NULL,
                            subtitle,
                            info = NULL,
                            icon = NULL,
                            color = "aqua",
                            width = 4,
                            href = NULL) {

  shinydashboard:::validateColor(color)

  if (!is.null(icon)) shinydashboard:::tagAssert(icon, type = "i")

  info_icon <- tags$small(
    tags$i(
      class = "fa fa-info-circle fa-lg",
      title = info,
      `data-toggle` = "tooltip",
      style = "color: rgba(255, 255, 255, 0.75);"
    ),
    class = "pull-right float-right"
  )

  boxContent <- div(
    class = paste0("small-box bg-", color),
    div(
      class = "inner",
      tags$small(title),
      if (!is.null(sparkobj))
        info_icon,
      h3(value),
      if (!is.null(sparkobj))
        sparkobj,
      p(subtitle)
    ),
    if (!is.null(icon))
      div(class = "icon-large icon", icon, style = "z-index; 0")
  )

  if (!is.null(href)) boxContent <- a(href = href, boxContent)

  div(
    class = if (!is.null(width)) paste0("col-sm-", width),
    boxContent
  )
}

hc_theme_sparkline_vb <- function(...) {

  theme <- list(
    chart = list(
      backgroundColor = NULL,
      margins = c(0, 0, 0, 0),
      spacingTop = 0,
      spacingRight = 0,
      spacingBottom = 0,
      spacingLeft = 0,
      plotBorderWidth = 0,
      borderWidth = 0,
      style = list(overflow = "visible")
    ),
    xAxis = list(
      visible = FALSE,
      endOnTick = FALSE,
      startOnTick = FALSE
    ),
    yAxis = list(
      visible = FALSE,
      endOnTick = FALSE,
      startOnTick = FALSE
    ),
    tooltip = list(
      outside = FALSE,
      shadow = FALSE,
      borderColor = "transparent",
      botderWidth = 0,
      backgroundColor = "transparent",
      style = list(textOutline = "5px white")
    ),
    plotOptions = list(
      series = list(
        marker = list(enabled = FALSE),
        lineWidth = 2,
        shadow = FALSE,
        fillOpacity = 0.25,
        color = "#FFFFFFBF",
        fillColor = list(
          linearGradient = list(x1 = 0, y1 = 1, x2 = 0, y2 = 0),
          stops = list(
            list(0.00, "#FFFFFF00"),
            list(0.50, "#FFFFFF7F"),
            list(1.00, "#FFFFFFFF")
          )
        )
      )
    ),
    credits = list(
      enabled = FALSE,
      text = ""
    )
  )

  theme <- structure(theme, class = "hc_theme")

  if (length(list(...)) > 0) {
    theme <- hc_theme_merge(
      theme,
      hc_theme(...)
    )
  }

  theme
}

set.seed(123)

N <- 20

x <- cumsum(rnorm(N)) + 0.5 * cumsum(runif(N))
x <- round(200*x)

df <- data.frame(
  x = sort(as.Date(Sys.time() - lubridate::days(1:N))),
  y = abs(x)
)

df

library(highcharter)

hc_theme_sparkline2 <- function(...) {

  theme <- list(
    chart = list(
      backgroundColor = NULL,
      margins = c(0, 0, 0, 0),
      spacingTop = 0,
      spacingRight = 0,
      spacingBottom = 0,
      spacingLeft = 0,
      plotBorderWidth = 0,
      borderWidth = 0,
      style = list(
        overflow = "visible"
      ),
      skipClone = TRUE
    ),
    xAxis = list(
      visible = FALSE,
      endOnTick = FALSE,
      startOnTick = FALSE
    ),
    yAxis = list(
      visible = FALSE,
      endOnTick = FALSE,
      startOnTick = FALSE
    ),
    tooltip = list(
      outside = TRUE,
      headerFormat = "",
      pointFormat = "{point.x}: <b>{point.y}</b>"
    ),
    plotOptions = list(
      series = list(
        marker = list(enabled = FALSE),
        lineWidth = 1,
        shadow = FALSE,
        fillOpacity = 0.25
      )
    )
  )

  theme <- structure(theme, class = "hc_theme")

  if (length(list(...)) > 0) {
    theme <- hc_theme_merge(
      theme,
      hc_theme(...)
    )
  }

  theme
}

valueBoxSpark <- function(value, subtitle, icon = NULL, color = "aqua",
                          width = 4, href = NULL, spark = NULL, height_spark = "100px",minititle = NULL) {

  shinydashboard:::validateColor(color)

  if (!is.null(icon))
    shinydashboard:::tagAssert(icon, type = "i")

  boxContent <- div(
    class = paste0("small-box bg-", color),
    div(
      class = "inner",
      if(!is.null(minititle)) tags$small(minititle),
      h3(value),
      # tags$span(style = paste0("height:", height_spark), hc_size(spark, height = "100vh")),
      tags$span(hc_size(spark, height = height_spark)),
      if (!is.null(subtitle)) p(subtitle)
    ),
    if (!is.null(icon)) div(class = "icon-large", icon)
  )

  if (!is.null(href))
    boxContent <- a(href = href, boxContent)

  div(class = if (!is.null(width))
    paste0("col-sm-", width), boxContent)
}

iso3_to_flag_n_name <- function(country_iso = c("aus", "chl")) {

  tibble(country_iso = country_iso) %>%
    left_join(countries %>% select(country_iso, country_name_english, iso2), by = "country_iso") %>%
    select(country = country_name_english, iso2) %>%
    pmap_chr(function(country = "Australia", iso2 = "au") {

      urlflag <- paste0("https://cdn.rawgit.com/lipis/flag-icon-css/master/flags/4x3/", tolower(iso2), ".svg")

      as.character(HTML(paste(tags$img(src = urlflag), country)))

    })

}

hc <- hchart(df, "area", hcaes(x, y), name = "lines of code")  %>%
  hc_size(height = 100) %>%
  hc_credits(enabled = FALSE) %>%
  hc_add_theme(hc_theme_sparkline_vb())

hc

hc2 <- hchart(df, "line", hcaes(x, y), name = "Distance")  %>%
  hc_size(height = 100) %>%
  hc_credits(enabled = FALSE) %>%
  hc_add_theme(hc_theme_sparkline_vb())

hc3 <- hchart(df, "column", hcaes(x, y), name = "Daily amount")  %>%
  hc_size(height = 100) %>%
  hc_credits(enabled = FALSE) %>%
  hc_add_theme(hc_theme_sparkline_vb())
