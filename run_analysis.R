# Getting and Cleaning Data Course Project

# Set working directory 
setwd("D:/R Programming/CourseA_R_Programming/Unit 3 Getting and Cleaning Data/project/UCI Har Dataset")

# Read features file for tests and training measurements in X_test.txt and X_train.txt files
featuresDF <- read.table("./features.txt", header = FALSE)                # dim: 561 x 2
names(featuresDF) <- c("featureID", "featureName")

# Read activity labels file for tests and training 
# Rename variable of data frame with descriptive name
activityLabelsDF <- read.table("./activity_labels.txt", header = FALSE)   # dim: 6 x 2; column names: V1, V2;  R1: 1 WALKING
names(activityLabelsDF) <- c("activityID", "activityName")

# Read subjects files for tests and training
# Combine subjects data frames for tests and training
# Rename variable name of combined data frame with descriptive name
subjectsTest <- read.table("./test/subject_test.txt", header = FALSE)
subjectsTrain <- read.table("./train/subject_train.txt", header = FALSE)
subjectsDF <- rbind(subjectsTest, subjectsTrain)                          # dim: 10299 x 1; column name: V1
names(subjectsDF) <- "subjectID"

# Read activities files for tests and training
# Combine activities data frames for tests and training
# Rename variable name of combined data frame with descriptive name
activitiesTest <- read.table("./test/y_test.txt", header = FALSE)
activitiesTrain <- read.table("./train/y_train.txt", header = FALSE)
activitiesDF <- rbind(activitiesTest, activitiesTrain)                    # dim: 10299 x 1; column name: V1 
names(activitiesDF) <- "activityID"

# Read measurements files for tests and training
# Combine measurements data frames for tests and training
# Rename variable names of combined data frame with the feature names in data.frame featuresDF
measuresTest <- read.table("./test/X_test.txt", header = FALSE)
measuresTrain <- read.table("./train/X_train.txt", header = FALSE)
measuresDF <- rbind(measuresTest, measuresTrain)                          # dim: 10299 x 561   column names: V1, V2, ..., V561
featureNames <- featuresDF[,2]
names(measuresDF) <- featureNames

##
# Tidy data into one data frame to contain the following 3 categories of information:
#   <subject id>,
#   <descriptive activity name for the activity type performed by the subjects>,
#   <the mean and std measurement values related to the activity type>.
##

# Tidying step 1: Join information of activitiesDF and activityLabelsDF based on common variable, activityID,
#                 to draw out the description of the activity type performed such as STANDING, WALKING, etc.
library(dplyr)
joinedActivitiesAndLabelsDF <- inner_join(activitiesDF, activityLabelsDF, by = "activityID")   # dim: 10299 x 2
activityType <- joinedActivitiesAndLabelsDF[, "activityName"]

# Tidying step 2: Join subjectsDF and activityNames 
tidyDF <- cbind(subjectsDF, activityType)                                 # dim: 10299 x 2; column names: subjectID, activityType

# Tidying step 3: Join tidyDF in step 2 and measurements of activities performed 
tidyDF <- cbind(tidyDF, measuresDF)                                       # dim: 1299 x 563; column names: subjectID, activityType, tBodyAcc-mean()-X, tBodyAcc-mean()-Y, ...

##
# Select data from tidy data frame that match requirements
##
# Data set 1: Select only mean and standard deviation values for each measurement  
selectList <- match(c("subjectID", "activityType"), names(tidyDF))
selectList <- c(selectList, grep("mean\\(\\)|std\\(\\)", names(tidyDF)))
subTidyDF1 <- select(tidyDF, selectList)                                  # dim: 10299 x 68

# Data set 2: Based on subTidyDF1, create a data set with the average of each variable 
#             for each activity and each subject. 
subTidyDF2 <- aggregate(. ~ subjectID + activityType, subTidyDF1, mean)    # dim: 180 x 68
subTidyDF2 <- subTidyDF2[order(subTidyDF2$subjectID, subTidyDF2$activityType),]

### Save subTidyDF2 dataset to local file - for submission
write.table(subTidyDF2, file = "subTidyDF2.txt", row.name = FALSE)

