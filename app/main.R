box::use(
  shiny[bootstrapPage, div, moduleServer, NS, tags, fluidPage,a],
  shiny.router[router_ui, route, router_server, route_link],
)

box::use(
  app/view/home/home,
  app/view/search/search,
  app/view/tool/tool,
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  bootstrapPage(
    title = "生信大数据",
    tags$nav(
      class = "navbar",
      tags$ul(
        class = "nav navbar-nav",
        tags$li(
          a("Home", href = route_link("/"))
        ),
        tags$li(
          a("Search", href = route_link("search"))
        ),
        tags$li(
          a("Tool", href = route_link("tool"))
        )
      )
    ),

    router_ui(
      route("/", home$ui(ns("home"))),
      route("search", search$ui(ns("search"))),
      route("tool", tool$ui(ns("tool")))
    )
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    router_server("/")

    home$server("home")
    search$server("search")
    tool$server("tool")
  })
}
