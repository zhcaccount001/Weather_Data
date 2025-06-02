library(plumber)

#* @post /predict
function(req, res) {
  tryCatch({
    input <- jsonlite::fromJSON(req$postBody)
    df <- as.data.frame(input)
    
    high_model <- readRDS("D:/Weather_Data/model_api/high_model.rds")
    low_model  <- readRDS("D:/Weather_Data/model_api/low_model.rds")
    
    # Predict directly (no column removal needed)
    high_pred <- predict(high_model, newdata = df)
    low_pred  <- predict(low_model, newdata = df)
    
    list(high_temp = round(high_pred, 1),
         low_temp  = round(low_pred, 1))
  }, error = function(e) {
    res$status <- 500
    list(error = e$message)
  })
}


