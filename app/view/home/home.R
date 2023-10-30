box::use(
  shiny[NS, div, moduleServer, p, actionButton, observeEvent],
  shiny.router[change_page]
)

ui <- function(id) {
  ns <- NS(id)
  div(
    p("切换到搜索页面，并且传递参数"),
    actionButton(inputId = ns("test"), label = "test")
  )
}

server <- function(id) {

  moduleServer(id, function(input, output, session) {
    observeEvent(input$test, {
      print("peter")
      change_page(paste0("search?key=peter123"))
    })
  })
}