library(dplyr)

##download, unzip data

if (!file.exists("./getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")) {
  fURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fURL,destfile="getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
}

flist<- unzip("getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", list=TRUE)$Name

#unzip("./getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

##load data into data frames

features <- read.table("./UCI HAR Dataset/features.txt")

testData <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features[,2])
testY <- read.table("./UCI HAR Dataset/test/y_test.txt")
testSub <- read.table("./UCI HAR Dataset/test/subject_test.txt")

test <- mutate(testData, Subject = testSub[,1], Activity = testY[,1])

trainData <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features[,2])
trainY <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainSub <- read.table("./UCI HAR Dataset/train/subject_train.txt")

train <- mutate(trainData, Subject = trainSub[,1], Activity = trainY[,1])

fulData <- rbind(test, train)
##

selFeatures <- grep("mean\\(\\)|std\\(\\)", features[, 2])
selFeatures <- c(selFeatures,562,563)



#mutate
