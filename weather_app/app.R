library(shiny)
library(httr)
library(jsonlite)

ui <- fluidPage(
  titlePanel("Temperature Predictor"),
  sidebarLayout(
    sidebarPanel(
      numericInput("feature1", "Average Pressure", value = 0),
      numericInput("feature2", "Average wind speed", value = 0),
      numericInput("feature3", "Average max. wind speed", value = 0),
      numericInput("feature4", "Average wind speed gusts", value = 0),
      numericInput("feature5", "Average humidity", value = 0),
      numericInput("feature6", "Average rainfall", value = 0),
      numericInput("feature7", "Average rain fall days", value = 0),
      numericInput("feature8", "Average day light", value = 0),
      numericInput("feature9", "Average sunshine", value = 0),
      numericInput("feature10", "Average sunshine days", value = 0),
      numericInput("feature11", "Average UV index", value = 0),
      numericInput("feature12", "Average Cloud cover", value = 0),
      numericInput("feature13", "Average Visibility", value = 0),
      actionButton("predict", "Predict")
    ),
    mainPanel(
      verbatimTextOutput("result")
    )
  )
)

server <- function(input, output) {
  observeEvent(input$predict, {
    input_data <- list(average_pressure = input$feature1,
                       average_wind_speed = input$feature2,
                       average_max_wind_speed = input$feature3,
                       average_wind_speed_gusts = input$feature4,
                       average_humidity = input$feature5,
                       average_rainfall = input$feature6,
                       average_rain_fall_days = input$feature7,
                       average_day_light = input$feature8,
                       average_sunshine = input$feature9,
                       average_sunshine_days = input$feature10,
                       average_uv_index = input$feature11,
                       average_cloud_cover = input$feature12,
                       average_visibility = input$feature13)
    res <- POST("http://127.0.0.1:34249/predict",
                body = toJSON(input_data, auto_unbox = TRUE),
                content_type_json())
    result <- content(res)
    output$result <- renderPrint(result)
  })
}

shinyApp(ui, server)