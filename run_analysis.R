########## Getting and Cleaning Data Project ############
## by: A.L. Mendoza
## Created: June 29, 2018
## Last Revised: June 29, 2018

library(plyr)
library(dplyr)

#### Download the dataset and unzip

file_name <- "getdata_projectfiles_UCI HAR Dataset.zip"
file_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists(file_name)) { download.file(file_URL, file_name)}
if(!file.exists("UCI HAR Dataset")) { unzip(file_name) }

#### Load both train and test datasets

train <- read.table("UCI HAR Dataset/train/X_train.txt")
trainAct <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubj <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubj, trainAct, train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")
testAct <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubj <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubj, testAct, test)

#### Merges the training and the test sets to create one data set.

mergedData <- rbind(train, test)

#### Appropriately labels the data set with descriptive variable names.

## Load activity features and labels

act_Labels <- read.table("UCI HAR Dataset/activity_labels.txt")
act_Labels <- mutate(act_Labels, V2 = as.character(act_Labels$V2))
features <- read.table("UCI HAR Dataset/features.txt")
features <- mutate(features, V2 = as.character(features$V2))

## get the names of mean and std to be used for extracting later from the dataset

mean_std_names_only <- grep("[Mm]ean|[Ss]td", features$V2, value=TRUE)
all_names <- grep("*", features$V2, value=TRUE)

colnames(mergedData) <- c("subjects", "activities", all_names)

#### Extracts only the measurements on the mean and standard deviation for each measurement.

mergedData <- subset(mergedData, select=c("subjects","activities",mean_std_names_only))

#### Uses descriptive activity names to name the activities in the data set
## turn activities & subjects into factors

mergedData$activities <- factor(mergedData$activities, levels = act_Labels[,1], labels = act_Labels[,2])
mergedData$subjects <- as.factor(mergedData$subjects)

#### From combined data, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

mean_data <- ddply(mergedData, .(subjects, activities), function(x) colMeans(x[, 3:88]))
write.table(mean_data, "mean_tidydata.txt", row.names = FALSE, quote = FALSE)

