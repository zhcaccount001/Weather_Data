library(readr)
data <- read_csv("data/weather_data.csv")

names(data)[names(data) == "Avergae wind speed gusts"] <- "Average wind speed gusts"
names(data)[names(data) == "Average UV inedx"] <- "Average UV index"
names(data)[names(data) == "Average Visability"] <- "Average Visibility"

# Clean column names (remove spaces and special characters)
clean_names <- function(names) {
  names <- gsub(" ", "_", names)
  names <- gsub("[^[:alnum:]_]", "", names)
  tolower(names)
}

colnames(data) <- clean_names(colnames(data))

# Build models
high_model <- lm(
  average_high_temperature ~ .,
  data = data[, c("average_high_temperature", setdiff(colnames(data), c("average_high_temperature", "average_low_temperature")))]
)

low_model <- lm(
  average_low_temperature ~ .,
  data = data[, c("average_low_temperature", setdiff(colnames(data), c("average_high_temperature", "average_low_temperature")))]
)

# Save updated models
saveRDS(high_model, "D:/Weather_Data/model_api/high_model.rds")
saveRDS(low_model, "D:/Weather_Data/model_api/low_model.rds")

