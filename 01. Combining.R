# Installing and loading the necessary packages

install.packages("tidyverse")
install.packages("rmarkdown")
library(tidyverse)  #helps wrangle data
library(lubridate)  #helps wrangle date attributes
library(ggplot2)  #helps visualize data
library(hms)
library(dplyr)
library(rmarkdown)

getwd() #displays your working directory
setwd("/Users/skj/Documents/GOOGLE DATA ANALYTICS/bike case/csv") #sets your working directory to simplify calls to data ... make sure to use your OWN username instead of mine ;)

#=====================
# STEP 1: COLLECT DATA
#=====================
df1 <- read_csv("202207-divvy-tripdata.csv")
df2 <- read_csv("202208-divvy-tripdata.csv")
df3 <- read_csv("202209-divvy-publictripdata.csv")
df4 <- read_csv("202210-divvy-tripdata.csv")
df5 <- read_csv("202211-divvy-tripdata.csv") 
df6 <- read_csv("202212-divvy-tripdata.csv")
df7 <- read_csv("202301-divvy-tripdata.csv")
df8 <- read_csv("202302-divvy-tripdata.csv")
df9 <- read_csv("202303-divvy-tripdata.csv")
df10 <- read_csv("202304-divvy-tripdata.csv")
df11 <- read_csv("202305-divvy-tripdata.csv")
df12 <- read_csv("202306-divvy-tripdata.csv")

#====================================================
# STEP 2: WRANGLE DATA AND COMBINE INTO A SINGLE FILE
#====================================================

# Stack individual data frames into one big data frame
all_trips <- bind_rows(df1,df2,df3,df4,df5,df6,df7,df8,df9,df10,df11,df12)