Getting and Cleaning Data Class Project
=======================================

##Introduction
This repository contains a script (run_analysis.R) designed to read data from UCI's Human Activity Recognition Using Smartphones Data Set. More information can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

The data can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
or through R with:

    fURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fURL,destfile="getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

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
!!!!!!!maybe   data.table

##Usage

