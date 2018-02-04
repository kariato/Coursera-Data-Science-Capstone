fluidPage(
  # Application title
  titlePanel("Word Cloud"),

  sidebarLayout(
    # Sidebar with a slider and selection inputs
    sidebarPanel(
      textInput("txt", "Type word so I can guess the next:", ""),
      hr(),
      sliderInput("max",
                  "Maximum Number of Words on word cloud:",
                  min = 1,  max = 30,  value = 20)
    ),

    # Show top word and the Word Cloud
    mainPanel(
      h1("Top Word"),
      h3("This is the top prediction for the next word given your sentance"),
      h2(verbatimTextOutput("topword")),
      h1("Word Cloud Results"),
      h3("These are the words I predict large to small is how likely"),
      plotOutput("plot")
    )
  )
)
