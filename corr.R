corr <- function(directory, threshold = 0) {
  
  lst <- lapply(file.path(directory, list.files(path = directory, pattern="*.csv")), data.table::fread)
  dt <- rbindlist(lst)
  
  
  dt <- dt[complete.cases(dt),]
  
  dt <- dt[, .(nobs = .N, corr = cor(x = sulfate, y = nitrate)), by = ID][nobs > threshold]
  return(dt[, corr])
}


## Examples trials :
library(data.table)
source("corr.R")
source("complete.R")

cr <- corr(directory = "C:/git/Rprogramming/specdata", threshold = 150)
head(cr)
## Answer :
##  [1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
summary(cr)
## Answer :
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
##  -0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313
cr <- corr(directory = "C:/git/Rprogramming/specdata", threshold = 400)
head(cr)
## Answer :
##  [1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884 -0.15782860
summary(cr)
## Answer :
##    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.17623 -0.03109  0.10021  0.13969  0.26849  0.76313 

cr <- corr(directory = "C:/git/Rprogramming/specdata", threshold = 5000)
summary(cr)
## Answer :
##     Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
length(cr)
## Answer :
## [1] 0

cr <- corr(directory = "C:/git/Rprogramming/specdata")
summary(cr)
## Answer :
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
##  -1.00000 -0.05282  0.10718  0.13684  0.27831  1.00000 
length(cr)
## Answer :
## [1] 323 