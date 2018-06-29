# Getting and Cleaning Data Project 

## Introduction

The script _**run_analysis.R**_ and performs the following as described in the projects requirements:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## R Packages used in the script

* library(plyr)
*  library(dplyr)

## Dataset Used and corresponding R variables that contain them

* _**file_name**_ : represents the filename to be used for the compressed file which is  **getdata_projectfiles_UCI HAR Dataset.zip**
* _**file_URL**_  : contains the url where the compressed file was sourced from which is **https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip **

* _**train**_ : contains the data from X_train.txt file
* _**trainAct**_ : contains the data from Y_train.txt file
* _**trainSubj**_ : contains the data from subject_train.txt file 
* _**train**_ : contains the data from combining the trainSubj, trainAct, and train variables

* _**test**_ : contains the data from X_test.txt file
* _**testAct**_ : contains the data from Y_test.txt file
* _**testSubj**_ : contains the data from subject_test.txt file
* _**test**_ : contains the data from combining the testSubj, testAct, and test train variables

## Other Variables used in the script

* _**mergedData**_	: contains the combined test and train data set with selected measurements on the mean and standard deviation.  
* _**act_Labels**_ : contains the activity labels from the activity_labels.txt file 
* Activity Labels are the following:
1. WALKING
2. WALKING_UPSTAIRS 
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

* _**features**_ : contains the data in features.txt
* _**mean_std_names_only** : contains a list of names of mean and standard deviation measurement 
* _**all_names**_ : contains a list of names in as indicated in features.txt file
* _**mean_data**_  	: contains the column mean per subject + activity

## filename for the tidy data

* _**mean_tidydata.txt**_ : the name of the file that contains the tidy data for further analysis


