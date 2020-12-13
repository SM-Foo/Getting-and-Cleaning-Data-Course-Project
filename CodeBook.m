CodeBook.file 

###
INTRODUCTION
###
The file documents transformations done to data sets by run_analysis.R and 
the decribes the variables of the 2 final data sets required by the project 
requirements as well as some intermediate data sets.

###
A. Data Transformation.
###

All text files mentioned in the documents were downloaded from the link provided
by the course project write-up. The link is reproduced below:
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 
The data in 'features.txt' is read into R as the data.frame object, featuresDF.

The data in 'activity_labels.txt' is read into R as the data.frame object, activityLabelsDF.

The data in 'subject_train.txt' is appended to the end of the data in 'subject_test.txt'
as the R data.frame object, subjectsDF.

The data in 'y_train.txt' is appended to the end of the data in 'y_test.txt'
as the R data.frame object, activitiesDF.

The data in 'X_train.txt' is appended to the end of the data in 'X_test.txt'
as the R data.frame object, measuresDF.

The data sets, subjectsDF, activitiesDF and measuresDF were combined to produce a 
tidy data set named tidyDF, with the information of activitiesDF used being the 
descriptive information rather than in id form. This is accomplished with the help
of activityLabelsDF, which transforms the integers (such as 1, 2, 3, erc.) representing 
activities into meaningful activity labels (such as WALKING, STANDING, etc.).

From tidyDF, the data set subTidyDF1 is generated as a required output. subTidyDF1 includes 
the subjects' ID, the activity decriptive labels, as well as mean and standard deviation
measurements.

From subTidyDF1, the data set subTidyDF2 is generated as a second required output. 
subTidyDF2 includes one row for each unique pair of subject ID and activitiy label.
And for each such row, all the mean values of the measurements included in subTidyDF1
included. subTidyDF2 is ordered according to the subject ID.

###
B. Structure and Variables of Data Sets
###
1. featuresDF has 2 variables
    featureID  : int  1 2 3 4 5 6 7 8 9 10 ...
    featureName: Factor w/ 477 levels "angle(tBodyAccJerkMean),gravityMean)",..: 243 244 245 250 251 252 237 238 239 240 ...

2. activityLabelsDF has 2 variables
  	activityID (int)     activityName (factor with 6 levels)
             	1	              WALKING
              2	              WALKING_UPSTAIRS
              3	              WALKING_DOWNSTAIRS
              4	              SITTING
              5	              STANDING
              6	              LAYING
              
3. subjectsDF has 1 variable
    subjectID (integer): Runs from 1 to 30, each represents one of the 30 subjects.

4. activitiesDF has 1 variable
    activityID (integer) : It can be any of the integers from 1 to 6, each representing
                           a type of activity as documented in activityLabelsDF.
                           
5. measuresDF has 561 variables
   All the 561 variables are numeric.
   
    The variable names are used to represent permutations from the following 2 lists of feature definitions: 
    tBodyAcc-XYZ          mean(): Mean value
    tGravityAcc-XYZ       std(): Standard deviation
    tBodyAccJerk-XYZ      mad(): Median absolute deviation
    tBodyGyro-XYZ         max(): Largest value in array
    tBodyGyroJerk-XYZ     min(): Smallest value in array
    tBodyAccMag           sma(): Signal magnitude area
    tGravityAccMag        energy(): Energy measure. Sum of the squares divided by the number of values
    tBodyAccJerkMag       iqr(): Interquartile range
    tBodyGyroMag          entropy(): Signal entropy
    tBodyGyroJerkMag      arCoeff(): Autorregresion coefficients with Burg order equal to 4
    fBodyAcc-XYZ          correlation(): correlation coefficient between two signals
    fBodyAccJerk-XYZ      maxInds(): index of the frequency component with largest magnitude
    fBodyGyro-XYZ         meanFreq(): Weighted average of the frequency components to obtain a mean frequency
    fBodyAccMag           skewness(): skewness of the frequency domain signal
    fBodyAccJerkMag       kurtosis(): kurtosis of the frequency domain signal
    fBodyGyroMag          bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window
    fBodyGyroJerkMag      angle(): Angle between to vectors

  In addition, a variable name may also be formed with the following vectors: 
    gravityMean
    tBodyAccMean
    tBodyAccJerkMean
    tBodyGyroMean
  
  Examples of variable names are:  
    tBodyAcc-mean()-X     fBodyAccJerk-meanFreq()-X
    tBodyAcc-mean()-Y     fBodyAccJerk-meanFreq()-Y
    tBodyAcc-mean()-Z     fBodyAccJerk-meanFreq()-Z
    tBodyAcc-std()-X      fBodyGyro-bandsEnergy()-1,8
    tBodyAcc-std()-Y      fBodyGyro-bandsEnergy()-9,16
    tBodyAcc-std()-Z      fBodyBodyGyroJerkMag-skewness()
    tBodyAcc-mad()-X      fBodyBodyGyroJerkMag-kurtosis()
    tBodyAcc-mad()-Y      angle(tBodyAccMean,gravity)
    tBodyAcc-mad()-Z      angle(X,gravityMean)
  
  The complete list of variables is extracted from the featureName column of the data set featuresDF.

6. tidyDF has 563 variables
    subjectID (int)
    activityType (factor with 6 levels)
    all the 561 numeric variables as in the data set measuresDF.

7. subTidyDF1 has 68 variables
    subjectID (int)
    activityType (factor with 6 levels)
    a subset of 66 of the 561 numeric variables in data set measuresDF that contain the pattern "mean()" or "std()" in their names
    
8. subTidyDF2 has 68 variables
    subjectID (int)
    activityType (factor with 6 levels)
    a subset of 66 of the 561 numeric variables in data set measuresDF that contain the pattern "mean()" or "std()" in their names

