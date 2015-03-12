# Downlaod the raw dataset
# (do this only once to download the raw data set initially)
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
#              destfile = "UCIHARData.zip", method = "curl")
#
# this is needed to set the working directory
# setwd("~/Documents/gacdata")
# restore previously saved workspace data
# load("~/Documents/gacdata/.RData")

# load necessary packages and libraris


# initialize tables with feature names
features <- read.table("features.txt")
# and table with descriptive activity names
activity_labels <- read.table("activity_labels.txt")

# read in the data for training 
X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")
# and data for the test set
X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Assign descriptive names to the columns (using the feature names table)
# Requirement 4. Appropriately labels the data set with descriptive variable names. 
colnames(X_train) <- features$V2
colnames(X_test) <- features$V2

# Requirement 1. Merges the training and the test sets to create one data set.
MergedX <- rbind(X_train, X_test)

# Requirement 2. Extracts only the measurements on the 
# mean and standard deviation for each measurement. 
MergedX <- MergedX[,grep("-mean|-std", features$V2)]

# create variable to store activity 
# Requirement 3. Uses descriptive activity names to name the activities in the data set
#
X_train$activity <- as.character(activity_labels[y_train$V1,"V2"])
X_test$activity <- as.character(activity_labels[y_test$V1,"V2"])
MergedX$activity <- c(X_train$activity,X_test$activity)
# replace the _ in the description with space
MergedX$activity <- sub("_"," ",MergedX$activity)

# test that the names are descriptive
# Requirement 4. Appropriately labels the data set with descriptive variable names. 
names(MergedX)
# tidyset1 is the first tidy DataSet
tidyset1 <- MergedX

# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
MergedX2 <- MergedX

# create extra variable to store subject 
MergedX2$subject <- c(subject_train$V1,subject_test$V1)

#aggregate(MergedX2, by=list(MergedX2$activity), FUN = mean)
#aggregate(MergedX2, by=list(MergedX2$subject), FUN = mean)
# tidyset2 is the second tidy DataSet
tidyset2 <- aggregate(MergedX2, by=list(MergedX2$activity,MergedX2$subject), FUN = mean)


