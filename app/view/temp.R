box::use(
  shiny[NS, div, moduleServer]
)

ui <- function(id) {
  ns <- NS(id)
  div('peter')
}

server <- function(id) {

  moduleServer(id, function(input, output, session) {

  })
}