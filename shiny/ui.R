shinyApp = dashboardPage(
  title = 'District Analytics',
  header = dashboardHeader(),
  sidebar = dashboardSidebar(
    collapsed = T,
    minified = T,
    sidebarMenu(
      menuItem('Geographic whereabouts!', tabName = 'page1', icon = icon("hospital")),
      menuItem('More charts!', tabName = 'page2', icon = icon("users"))
    )
  ),
  body = dashboardBody(
    tabItems(
      tabItem(
        tabName = "page1",
        fluidRow(
          valueBoxOutput('box1', width = 3),
          valueBoxOutput('box2', width = 3),
          valueBoxOutput('box3', width = 3),
          valueBoxOutput('box4', width = 3)
        ),
        
        fluidRow(
          box(title = "Map",
              solidHeader = F,
              width = 7,
              collapsible = T,
              leafletOutput('map_id', height = 400)
          ),
          box(title = "Charts",
              solidHeader = F,
              width = 5,
              collapsible = T,
              highchartOutput('pie_id', height = 400)
          )
        )
      )
    )
  )
)

