---
title: "Course Project - README"
author: "Getting and Cleaning Data"
date: "January 2015"
output: html_document
---
   
<br>

## Introduction

The arduous task of analyzing large data sets can be simplified by cleaning or tidying the data prior to analysis.  Such tidy data sets should adhere to four general principles.  They are:

- Each variable you measure should be in one column
- Each different observation of that variable should be in a different row
- There should be one table for each "kind" of variable
- If you have multiple tables, they should include a column in the table that allows them to be linked[1]

Data processed in this format works well with the data scientist's analysis tools in R.  To become familiar with this process, we will prepare tidy data from a given data set.

<br>

## The Raw Data

The data set for this project is located in a zip file [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).  It is a database to recognize human activity using smartphones with embedded inertial sensors attached to the subject's waist.  A complete description of the study can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  The required files for the project are located in the *UCI HAR Dataset* sub-directory of the zip file.  The contents of this directory are:

- activity_labels.txt - the activities performed by the 30 subjects in the study
- features.txt - a list of the 561 features or variables recorded during the study
- features_info.txt - an explanation of the variables measured in the study
- README.txt - a complete description of the study
- **test** folder - contains text files of the data for the test set
- **train** folder - contains text files of the data for the training set

<br>

## Creating the Tidy Data

Download the zip file to your computer and unzip it to a directory.  This computer must have RStudio (Version 0.98.1091) installed.  Set the working directory of RStudio to the *UCI HAR Dataset* directory.  Load the *plyr*, *dplyr*, and *reshape2* libraries in RStudio.

According to the project instructions, create the tidy data using one R script called run_analysis.R as follows: 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each  
subject.

<br>

#### *1. Merges the training and the test sets to create one data set.*

Before we can merge the training and test sets, we first have to read the various text files into R using the *read.table()* function.

```
R> subject_train <- read.table("./train/subject_train.txt")
R> x_train <- read.table("./train/X_train.txt")
R> y_train <- read.table("./train/y_train.txt")
R>
R> subject_test <- read.table("./test/subject_test.txt")
R> x_test <- read.table("./test/X_test.txt")
R> y_test <- read.table("./test/y_test.txt")
```

Once the files are read into R, we can form the training and test sets with the *cbind()* function.  We will also go ahead and use the *names()* function to name the first two columns of each set, ***subject*** and ***activity***, respectively.

```
R> train_set <- cbind(subject_train, y_train)
R> train_set <- cbind(train_set, x_train)
R> names(train_set)[1:2] <- c("subject", "activity")
R> 
R> test_set <- cbind(subject_test, y_test)
R> test_set <- cbind(test_set, x_test)
R> names(test_set)[1:2] <- c("subject", "activity")
```

Finally, we can merge the two sets with the *join()* function setting *type* to "full" (but it probably would have worked with any *type* since both sets have the same columns).

```
R> data <- join(train_set, test_set, type = "full")
```

<br>

#### *2. Extracts only the measurements on the mean and standard deviation for each measurement.*

Before we can extract the target measurements, we have to read the features or variables into R.

```
R> features <- read.table("features.txt")
```

Below is part of the file, features_info.txt, which describes the variables of the study.

> The set of variables that were estimated from these signals are: 
>
> mean(): Mean value  
> std(): Standard deviation  
> mad(): Median absolute deviation   
> max(): Largest value in array  
> min(): Smallest value in array  

According to the snippet, the mean and standard deviation are identified with "mean()" and "std()" in the variable name.  To extract the designated features use the *grep()* function.  We can then use that result to get the appropriate subset of the data set.

```
R> reduced_features <- grep("mean\\(\\)|std\\(\\)", features[, 2])
R> data_reduced <- subset(data, select = c(subject, activity, reduced_features+2))
```

<br>

#### *3. Uses descriptive activity names to name the activities in the data set.*

Read the activity names into R from the activity_labels.txt file using the *read.table()* function, change the names to lowercase with the *tolower()* function, and replace the underscores with spaces with the *gsub()* function.  Then replace the integer values in the activity column with the activity names as factors.

```
R> activity_names <- read.table("activity_labels.txt")[, 2]
R> activity_names <- tolower(activity_names)
R> activity_names <- gsub("_", " ", activity_names)
R> data_reduced$activity <- factor(data_reduced$activity, labels = activity_names)
```

<br>

#### *4. Appropriately labels the data set with descriptive variable names.*

Read the features or variables into R from the features.txt file using the *read.table()* function.  Use the *gsub()* function to remove punctuation and make the variable names as descriptive as possible.  Since the variable names are quite long, use a camelCase naming convention to make them readable.

```
R> var_names <- features[reduced_features, 2]
R> var_names <- gsub("-", "", var_names)
R> var_names <- gsub("\\(", "", var_names)
R> var_names <- gsub("\\)", "", var_names)
R> var_names <- gsub("^t", "timeDomainSignal", var_names)
R> var_names <- gsub("BodyBody", "Body", var_names)
R> var_names <- gsub("^fBody", "freqDomainSignalBody", var_names)
R> var_names <- gsub("mean", "Mean", var_names)
R> var_names <- gsub("std", "Std", var_names)
R> var_names <- gsub("Acc", "Acceleration", var_names)
R> var_names <- gsub("Gyro", "Gyroscope", var_names)
R> var_names <- gsub("Mag", "Magnitude", var_names)
R> var_names <- gsub("X", "OnXaxisOfPhone", var_names)
R> var_names <- gsub("Y", "OnYaxisOfPhone", var_names)
R> var_names <- gsub("Z", "OnZaxisOfPhone", var_names)  
R> names(data_reduced)[3:68] <- var_names
```

<br>

#### *5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.*

Use the *melt()* and *dcast()* functions to create an independent tidy data set with the average of each variable for each activity and each subject.  Then use the *write.table()* function (with row.names = FALSE) to output the data to a file, tidydata.txt, in the working directory.  Note that the script will open the data set from Step 4 as ***data_reduced*** and the data set from Step 5 as ***td*** for visual inspection.

```
R> tdMelt <- melt(data_reduced, id=c("subject", "activity"), measure.vars=names(data_red)[3:68])
R> tdData <- dcast(tdMelt, activity + subject ~ variable, mean)
R> td <- tdData[, c(2, 1, 3:68)]
R> write.table(td, file = "tidydata.txt", row.names = FALSE)
```
<br>

## Running the Script

1. Download the zip file to your computer and unzip it to a directory
2. Open RStudio (Version 0.98.1091)
3. Set the working directory of RStudio to the *UCI HAR Dataset* directory
4. Copy the *run_analysis.R* file to the working directory
5. Create an R object by sourcing the file
     + R> source("run_analysis.R")
6. Load the *plyr*, *dplyr*, and *reshape2* libraries in RStudio
7. Run the script
     + R> tidydata()

<br>

## References

[1] https://d396qusza40orc.cloudfront.net/getdata/lecture_slides/01_03_componentsOfTidyData.pdf

