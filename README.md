# Getting-and-Cleaning-Data-Course-Project
Unit 3 - Getting and Cleaning Data - Course Project

This repository includes the following files:
=============================================

1. 'README.txt' is this file that provides a list of files in this project repository.

2. 'run_analysis.R' is an R script that performs the following:

   - reads the appropriate raw data files downloaded from
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  
   - tidies data into a data frame
   
   - selects subset of the tidied data frame to include only mean and standard deviation measurements
   
   - from the subset, creates a new data set that compute means of the measurements for each activity for each subject
   
3. 'CodeBook.md' is a file that documents the variables in the final 2 data sets to be output 
    as part of the requirements of this project.
    It also documents some major transformation done from the raw data files to the final 2 data sets
    as well as some intermediate data sets used in the 'run_analysis.R' scripts.
   
