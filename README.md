Getting and Cleaning Data Class Project
=======================================

##Introduction
This repository contains a script (run_analysis.R) designed to read data from [UCI's Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and transform it into a tidy data set. Details can be found in the [Codebook.](https://github.com/acoelho/GettingCleaning/blob/master/CODEBOOK.md)  


##Data
The data can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
or through R with:

    fURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fURL,destfile="getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

The data needs to be extracted into the working directory:

   unzip("./getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

##Requirements
This script requires that your working directory contain these files in the listed directories:

    "UCI HAR Dataset/activity_labels.txt"                         
    "UCI HAR Dataset/features.txt"                                
    "UCI HAR Dataset/test/subject_test.txt"                       
    "UCI HAR Dataset/test/X_test.txt"                             
    "UCI HAR Dataset/test/y_test.txt"                             
    "UCI HAR Dataset/train/subject_train.txt"                     
    "UCI HAR Dataset/train/X_train.txt"                           
    "UCI HAR Dataset/train/y_train.txt"                         

It also requires the following R packages:

   dplyr

##Usage

Source the script with

    source('run_analysis.R')
   
The script will create a tidy data set in a file called "tidy_data.txt", which can be read and viewed in R with:

    data <- read.table("tidy_data.txt", header = TRUE) 
    View(data)