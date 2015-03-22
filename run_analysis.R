## Here are the data for the project:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## Assume that we have got the file ready
## Merges the training and the test sets to create one data set.
## Variables: activity ~ Y ; subject ~ S

    trainX <- read.table("train/X_train.txt")
    testX <- read.table("test/X_test.txt")
    X <- rbind(trainX, testX)

    trainY <- read.table("train/y_train.txt")
    testY <- read.table("test/y_test.txt")
    Y <- rbind(trainY, testY)

    trainS <- read.table("train/subject_train.txt")
    testS <- read.table("test/subject_test.txt")
    S <- rbind(trainS, testS)

    rm("trainX","trainY","trainS","testX","testY","testS")


## Extracts only the measurements on the mean and standard deviation for each measurement.

    features <- read.table("features.txt")
    # grep returns a "position vector" of the measurements on
    # the mean and standard deviation
    m_std_features_posi  <- grep("(-std\\(\\)|-mean\\(\\))",features$V2)

    # string vectors of the measurements on the mean and standard deviation
    m_std_name <- features[m_std_features_posi,2]

    # keep columns that are means or std. deviation
    Data <- NULL
    for (i in m_std_features_posi){
        command <- paste0("cbind(Data, X$V", i, ")")
        Data <- eval(parse(text = command))
    }
    Data <- as.data.frame(Data)

## Uses descriptive activity names to name the activities in the data set

    # Name each column of the data
    for (i in 1:length(Data)){
        names(Data)[i] <- levels(droplevels(m_std_name[i]))
    }

## Appropriately labels the data set with descriptive variable names.

    activity_labels  <- read.table("activity_labels.txt")
    activity <- as.factor(Y$V1)
    subject <- as.factor(S$V1)
    Data <- cbind(subject,activity,Data)
    write.table(Data, "tidy_data.txt", row.name=FALSE)

## From the data set in step 4, creates a second, independent tidy data set with the average
## of each variable for each activity and each subject.

    # Add the first row on the top
    # the average of each variable will be the first element of each row
    emp <- as.data.frame(t(rep(NA, length(Data))))
    names(emp) <- names(Data)
    Data <- rbind(emp, Data)
    # Compute mean of each vector & Assign average to each column
    # The first two rows are of type character
    for (i in 3:length(Data)){
        Data[1,i] <- mean(Data[,i], na.rm = TRUE)
    }
    # Write tidy data with average
    write.table(Data, "tidy_data_with_average.txt", row.name=FALSE)



