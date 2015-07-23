library(dplyr)

##download, unzip data

#if (!file.exists("./getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")) {
#  fURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#  download.file(fURL,destfile="getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
#}

#unzip("./getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

features <- read.table("./UCI HAR Dataset/features.txt")

#1 Merge the training and the test sets to create one data set.
testData <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features[,2])
testY <- read.table("./UCI HAR Dataset/test/y_test.txt")
testSub <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test <- mutate(testData, Subject = testSub[,1], Activity = testY[,1])

trainData <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features[,2])
trainY <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainSub <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train <- mutate(trainData, Subject = trainSub[,1], Activity = trainY[,1])

fulData <- rbind(test, train)

#2 Extract only the measurements on the mean and standard deviation for each measurement.

#load col numbers of 'mean' and 'std' measurements
selFeatures <- grep("mean\\(\\)|std\\(\\)", features[, 2])
#add the final two columns (Subject, Activity)
selFeatures <- c(selFeatures,562,563)

#subset full data set into only mean and std columns (+ Subject and Activity)
selData <- fulData[,selFeatures]

#3 Uses descriptive activity names to name the activities in the data set
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
activities[,2]<-tolower(activities[,2])
activities[,2]<-gsub("_", " ", activities[,2])
selData <- mutate(selData, Activity = activities[selData$Activity,2])

#4 Appropriately label the data set with descriptive variable names.
## This was actually started in step 1 when loading the data (lines 19 and 24)
names(selData) <- gsub("[[:punct:]]"," ",names(selData))
names(selData) <- gsub("   "," ",names(selData))


#5 Create a second, independent tidy data set with the average of each variable for each activity and each subject.
final <- aggregate(. ~ Subject + Activity, selData, mean)
final <- final[order(final$Subject,final$Activity),]

write.table(final, "tidy_data.txt", row.name=FALSE)

# Command to read the tidy data set:
# data <- read.table("tidy_data.txt", header = TRUE) 
# View(data)