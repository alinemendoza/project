# Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate how to collect, work with, and clean a data set. 

The goal is to prepare tidy data that can be used for later analysis.

The dataset used in this project was taken from:
[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

# Files in this Repository

_**CodeBook.md**_ : contains a description of all the variables and summaries calculated, and any other relevant information.

_**run_analysis.R**_ : contains the code the performs the requirements of this project which are the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

_**mean_tidydata.txt**_ : contains the result of the step #5 above.