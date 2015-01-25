tidydata <- function() {
     # load the necessary libraries
     library(plyr); library(dplyr); library(reshape2)
     
     # read the training set text files into R and create the training set data frame
     subject_train <- read.table("./train/subject_train.txt")
     x_train <- read.table("./train/X_train.txt")
     y_train <- read.table("./train/y_train.txt")
     train_set <- cbind(subject_train, y_train)
     train_set <- cbind(train_set, x_train)
     names(train_set)[1:2] <- c("subject", "activity")
     
     # read the test set text files into R and create the test set data frame
     subject_test <- read.table("./test/subject_test.txt")
     x_test <- read.table("./test/X_test.txt")
     y_test <- read.table("./test/y_test.txt")
     test_set <- cbind(subject_test, y_test)
     test_set <- cbind(test_set, x_test)
     names(test_set)[1:2] <- c("subject", "activity")
     
     # join the training and test sets into one data frame
     data <- join(train_set, test_set, type = "full")
     
     # read the features into R and extract the desired measurements
     features <- read.table("features.txt")
     reduced_features <- grep("mean\\(\\)|std\\(\\)", features[, 2])
     data_reduced <- subset(data, select = c(subject, activity, reduced_features+2))

     # read the activity names into R and convert the integer values of the 
     # activity column to factor activity labels
     activity_names <- read.table("activity_labels.txt")[, 2]
     activity_names <- tolower(activity_names)
     activity_names <- gsub("_", " ", activity_names) 
     data_reduced$activity <- factor(data_reduced$activity, labels = activity_names)
     
     # read the features into R and make the variable names descriptive
     var_names <- features[reduced_features, 2]
     var_names <- gsub("-", "", var_names)
     var_names <- gsub("\\(", "", var_names)
     var_names <- gsub("\\)", "", var_names)
     var_names <- gsub("^t", "timeDomainSignal", var_names)
     var_names <- gsub("BodyBody", "Body", var_names)
     var_names <- gsub("^fBody", "freqDomainSignalBody", var_names)
     var_names <- gsub("mean", "Mean", var_names)
     var_names <- gsub("std", "Std", var_names)
     var_names <- gsub("Acc", "Acceleration", var_names)
     var_names <- gsub("Gyro", "Gyroscope", var_names)
     var_names <- gsub("Mag", "Magnitude", var_names)
     var_names <- gsub("X", "OnXaxisOfPhone", var_names)
     var_names <- gsub("Y", "OnYaxisOfPhone", var_names)
     var_names <- gsub("Z", "OnZaxisOfPhone", var_names)
     names(data_reduced)[3:68] <- var_names
     
     # optionally view the reduced data set of Step 4 of the instructions
     View(data_reduced)

     # create the independent tidy data set of Step 5
     tdMelt <- melt(data_reduced, id=c("subject", "activity"), measure.vars=names(data_reduced)[3:68])
     tdData <- dcast(tdMelt, activity + subject ~ variable, mean)
     td <- tdData[, c(2, 1, 3:68)]
     
     # optionally view the independent tidy data set of Step 5 of the instructions
     # and visually compare it to the data set of Step 4
     View(td)
     
     # write the independent tidy data set of Step 5 to a file, tidydata.txt, in 
     # the working directory
     write.table(td, file = "tidydata.txt", row.names = FALSE)

     # send the tidy data output to the console
     td
}
