
complete <- function(directory, id= 1:332){
  ids = c()
  nobss = c()
  filenames = list.files(directory)
  
  for(i in id){
    
    filepath=paste(directory,"/" ,filenames[i], sep="")
    
    data = read.csv(filepath, header = TRUE)
    completeCases = data[complete.cases(data), ]
    
    ids =  c(ids, i)                    
    nobss = c(nobss, nrow(completeCases) )
  }
  data.frame(id=ids, nobs=nobss)
}



## Example trials: 
library(data.table)
source("complete.R")
complete("C:/git/Rprogramming/specdata", 1)
## Answer :

##  id nobs
## 1  1  117
complete("C:/git/Rprogramming/specdata", c(2, 4, 8, 10, 12))
## Answer :
##  id nobs
##1  2 1041
##2  4  474
##3  8  192
##4 10  148
##5 12   96

complete("C:/git/Rprogramming/specdata", 30:25)
## Answer:
##  id nobs
##1 30  932
##2 29  711
##3 28  475
##4 27  338
##5 26  586
##6 25  463

complete("C:/git/Rprogramming/specdata", 3)
## Answer :
##  id nobs
##1  3  243



