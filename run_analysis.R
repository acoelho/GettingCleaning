library(plyr)
library(curl)
##download, unzip data

if (!file.exists("./getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")) {
  fURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fURL,destfile="getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
}

unzip("./getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

##load data into data frames

testData <- read.table("./UCI HAR Dataset/test/X_test.txt")
testY <- read.table("./UCI HAR Dataset/test/Y_test.txt")
testSub <- read.table("./UCI HAR Dataset/test/subject_test.txt")
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")


fulData <- rbind(testData, trainData)
##

#mutate
