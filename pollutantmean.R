pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  fileNames <- paste0(directory, '/', formatC(id, width=3, flag="0"), ".csv" )
  
  lst <- lapply(fileNames, data.table::fread)
  dt <- rbindlist(lst)
  
  if (c(pollutant) %in% names(dt)){
    return(dt[, lapply(.SD, mean, na.rm = TRUE), .SDcols = pollutant][[1]])
  } 
}

install.packages("data.table")

# Example trials: 
library(data.table)
source("pollutantmean.R")
pollutantmean(directory = "C:/git/Rprogramming/specdata", pollutant = 'sulfate', id = 1:10)
## Answer:
## [1] 4.064128

pollutantmean(directory = "C:/git/Rprogramming/specdata", pollutant = 'nitrate', id = 70:72)
## Answer :
## [1] 1.706047
pollutantmean(directory = "C:/git/Rprogramming/specdata", pollutant = 'nitrate', id = 23)
## Answer: 
##  [1] 1.280833