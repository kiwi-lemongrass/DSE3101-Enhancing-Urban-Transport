library(shiny)
library(leaflet)
library(sf)
library(dplyr)
library(DT)
library(htmltools)

# Load the data
avai_score <- read.csv("/Users/gaoyuchen/Downloads/avail_with_score.csv")
planning_area_geojson <- st_read("/Users/gaoyuchen/Downloads/planning_area.geojson")
# Clean the geometries
planning_area_geojson <- st_make_valid(planning_area_geojson)

# Define UI
ui <- fluidPage(
  titlePanel("Availability Analysis"),
  tabsetPanel(
    tabPanel("Availability",
             sidebarLayout(
               sidebarPanel(
                 sliderInput('train_w', "weight on the num_trainstations", min = 0, max = 1, value = 0.25, step = 0.01),
                 sliderInput('busstop_w', "weight on the num_busstops", min = 0, max = 1, value = 0.25, step = 0.01),
                 sliderInput('busfreq_w', "weight on the avg_bus_freq", min = 0, max = 1, value = 0.25, step = 0.01),
                 sliderInput('busservice_w', "weight on num_busservices", min = 0, max = 1, value = 0.25, step = 0.01),
                 actionButton("seeMap", "See the Map")
               ),
               mainPanel(
                 leafletOutput("map")
               )
             )
    ),tabPanel("Table View", # New tab for the detail view
               DTOutput("detailsTable") # Output for the DataTable
    )
    
  )
)

# Define server logic
server <- function(input, output, session) {
  observeEvent(input$seeMap, {
    total_points <- input$train_w + input$busstop_w + input$busfreq_w+input$busservice_w
    
    if (total_points != 1.0) {
        showNotification(
          paste("Total weight must equal 1. Current total is ", total_points),
          duration = 5,
          type = "error"
        )
    }  else {
      # Calculate the scores
      avai_score$score <- with(avai_score, round(input$train_w*num_trainstations_score + input$busstop_w*num_busstops_score + input$busfreq_w*avg_bus_freq_score+input$busservice_w*num_busservices_score,2))
     
      # Merge the scores with the geojson data
      merged_data <- merge(planning_area_geojson, avai_score, by = "planning_area")
      print(head(merged_data))
      
      # Render the map with Leaflet
      output$map <- renderLeaflet({
        leaflet() %>%
          addProviderTiles("CartoDB.Positron") %>%
          addPolygons(data = merged_data,
                      fillColor = ~colorNumeric("RdYlGn", domain = merged_data$score)(score),
                      fillOpacity = 0.7,
                      color = "black",
                      weight = 1,
                      label = ~paste(planning_area, ": ", score),
                      labelOptions = labelOptions(direction = "auto", permanent = FALSE))%>%
          addLegend(pal = colorNumeric("RdYlGn", domain = merged_data$score),
                    values = merged_data$score,
                    title = "Availability Score",
                    position = "bottomright")
      })
      output$detailsTable <- renderDT({
        avai_score <- avai_score %>%  
          select(-num_busstops_score,-num_trainstations_score,-num_busservices_score,-avg_bus_freq_score,-total_score)%>%
          arrange(desc(score)) # Change this line to arrange by your criteria
        datatable(avai_score, options = list(pageLength = 10))
      }, server = FALSE) # Using server-side processing if the dataset is large
    }
    })
  }

# Run the application
shinyApp(ui = ui, server = server)
