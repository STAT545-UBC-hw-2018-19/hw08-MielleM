library(shiny)
library(ggplot2)
library(dplyr)
library(DT)

bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)

ui <- fluidPage(
  titlePanel("BC Liquor Store prices"),
  sidebarLayout(
    sidebarPanel(
    	img(src = "bclimage.png"),
    	tags$br(),
      sliderInput("priceInput", "Price", 0, 100, c(15, 30), pre = "$"),
      selectInput(multiple = TRUE, "typeInput", "Product type",
                  choices = c(bcl$Type),
                  selected = c("BEER", "WINE", "SPIRITS", "REFRESHMENT")),
      checkboxInput("countrycheckbox", "Filter by country", FALSE),
      uiOutput("conditionalInput"),
      uiOutput("countryOutput")
    ),
    mainPanel(
      plotOutput("coolplot"),
      br(), br(),
      DT::dataTableOutput("results")
    )
  )
)

server <- function(input, output) {
  output$countryOutput <- renderUI({
    if(input$countrycheckbox) {
    selectInput("countryInput", "Country",
                sort(unique(bcl$Country)),
                selected = "CANADA")
    
    }
  })  
  

  filtered <- reactive({
    if (is.null(input$countryInput)) {
      return(NULL)
    }


    bcl %>%
      filter(Price >= input$priceInput[1],
             Price <= input$priceInput[2],
             Type == input$typeInput,
             Country == input$countryInput
      )
  })
  
  output$coolplot <- renderPlot({
    if (is.null(filtered())) {
    	return(ggplot(bcl, aes(Alcohol_Content)) +
    		geom_histogram() +
    			ggtitle("BCL Products") +
    			xlab("Alcohol Content") +
    			ylab("Number of products") +
    			theme_light())
    }
    ggplot(filtered(), aes(Alcohol_Content)) +
      geom_histogram() +
    	ggtitle("BCL Products") +
    	xlab("Alcohol Content") +
    	ylab("Number of products") +
    	theme_light()
  })

  output$results <- DT::renderDataTable({
    filtered()
  })
}

shinyApp(ui = ui, server = server)
