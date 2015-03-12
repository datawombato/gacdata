# CodeBook tidyset1 and tidyset2

# Processing steps from raw training and test data sets to tidyset1

1. Create a data frame features containing all the features by reading feature.txt
2. Create a data frame activity_labels containing all the activities by reading activity_labels.txt
3. Create data frame X_train by reading from "train\X_train.txt". This contains the features data.
4. Create data frame y_train by reading from "train\y_train.txt". This contains the labelled activity class for each corresponding feature data row in X_train
5. Create data frame subject_train by reading from "train\subject_train.txt". This contains the subject that was involved in each corresponding row in X_train and y_train
6. Create similir data frames from the test set, X_test, y_test, subject_test.
7. Rename the columns names of X_train, X_test using the features data frame
8. Combine (with rbind), X_train and X_test into MergedX
9. Using grep(), select only column names in MergedX with -std and -mean because we only
need measurements on the mean and standard deviation
10. Create extra column variable (activity) to store descriptive activity label
11. Copy MergedX into tidyset1

# Processing steps from raw training and test data sets, tidyset1 to tidyset2
1. Duplicate MergedX to MergedX2
2. Create extra variable (subject) column to store subject for the readings
3. Using the aggregate() by activity, subject, using the mean() function
4. Store aggregate result as tidyset2

