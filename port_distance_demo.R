install.packages("geosphere")
getwd()
library(geosphere)

##########################################################
###################     great circle    ##################
##########################################################

#demo

# change directory
setwd("...")

# filenames <- gsub("\\.csv$","", list.files(pattern="\\.csv$"))

# filenames

fnames <- list.files(pattern = "\\.csv$")

fnames

for(i in fnames)
{
  test <- read.csv(i)

# load interested columns and change to matrix
test1 <- data.matrix(test[,c(3,2)])


# calculate distance
d <- distm(test1, fun = distHaversine)

# convert to nautical mile
distan1 <- d*0.000539957
distan1

#get position info
t <- row(distan1)-col(distan1)

# split matrix based on diagonals
s <- split(distan1,t)

# get info of interest
r <- s["-1"]
r

#convert list as dataframe
r <- as.data.frame(r)

cumr <- cumsum(r)

#change column names

colnames(cumr)[1] <- "estimate"

#add first row
f <- data.frame(0)
colnames(f)[1] <- "estimate"

#combine to cumulative table
n <- rbind(f,cumr)

tnew <- cbind(test,n)
tnew

if (i == "voyage_demo_Copenhagen_Port Rashid.csv")
  browser()
  

# export to csv
write.csv(tnew,file = i,row.names = F)


}


#voyage


# change directory
setwd("...")

# filenames <- gsub("\\.csv$","", list.files(pattern="\\.csv$"))

fnames <- list.files(pattern = "\\.csv$")

for(i in fnames)
{
  test <- read.csv(i)
  
  # load interested columns and change to matrix
  test1 <- data.matrix(test[,c(3,2)])
  
  # calculate distance
  d <- distm(test1, fun = distHaversine)
  
  # convert to nautical mile
  distan1 <- d*0.000539957
  distan1
  
  #get position info
  t <- row(distan1)-col(distan1)
  
  # split matrix based on diagonals
  s <- split(distan1,t)
  
  # get info of interest
  r <- s["-1"]
  r
  
  #convert list as dataframe
  r <- as.data.frame(r)
  
  cumr <- cumsum(r)
  
  #change column names
  
  colnames(cumr)[1] <- "estimate"
  
  #add first row
  f <- data.frame(0)
  colnames(f)[1] <- "estimate"
  
  #combine to cumulative table
  n <- rbind(f,cumr)
  
  tnew <- cbind(test,n)
  tnew
  
  # export to csv
  write.csv(tnew,file = i,row.names = F)
  
  
}






########################################################
#################  rhumb line   ########################
########################################################

library(geosphere)

# change directory

setwd("...")

# filenames <- gsub("\\.csv$","", list.files(pattern="\\.csv$"))

fnames <- list.files(pattern = "\\.csv$")

for(i in fnames)
{
  test <- read.csv(i)
  
  # load interested columns and change to matrix
  test1 <- data.matrix(test[,c(3,2)])
  
  # calculate distance
  d <- distm(test1, fun = distRhumb)
  
  # convert to nautical mile
  distan1 <- d*0.000539957
  
  #get position info
  t <- row(distan1)-col(distan1)
  
  # split matrix based on diagonals
  s <- split(distan1,t)
  
  # get info of interest
  r <- s["-1"]
  r
  
  #convert list as dataframe
  r <- as.data.frame(r)
  
  cumr <- cumsum(r)
  
  #change column names
  
  colnames(cumr)[1] <- "estimate"
  
  #add first row
  f <- data.frame(0)
  colnames(f)[1] <- "estimate"
  
  #combine to cumulative table
  n <- rbind(f,cumr)
  
  tnew <- cbind(test,n)
  tnew
  
  
  # export to csv
  write.csv(tnew,file = i,row.names = F)
  
  
}



