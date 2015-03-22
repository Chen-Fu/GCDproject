## GCDproject
This is for getting and cleaning data project.

## Data source: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## The goal of this project
Convert the raw data into a tidy data set and make a codebook

## Make a R script to do the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Main tasks
1. Combine training & testing data X_test, X_train, Y_test, Y_train, subject_test, subject_train into a data frame
2. The variable names of X is in the file feature.txt. We need to know which data should be extracted from X by observing feature.txt. I finished this work by using function grep.
3. Combine the chosen subset of data, combine them, and name each column of the data. The first tidy data,"tidy_data.txt", is ready now.
4. Add a row in the data.frame in order to create the second tidy data, "tidy_data_with_average.txt".

For detailed information, see run_analysis.R.
