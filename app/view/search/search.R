box::use(
  shiny[NS, div, moduleServer, reactive, verbatimTextOutput, renderPrint],
  shiny.router[get_query_param]
)

ui <- function(id) {
  ns <- NS(id)
  verbatimTextOutput(ns("key"))
}

server <- function(id) {

  moduleServer(id, function(input, output, session) {

    print('peter xxx ')
    getSearchKey <- reactive({
      key <- get_query_param("key")
      if (is.null(key)) {
        return("peter empty ")
      }

      return(key)
    })

    output$key <- renderPrint(getSearchKey())
  })
}