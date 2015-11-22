---
title: "README for Getting and Cleaning Data Course Project"
author: "Mark Fischer"
date: "Created 11/15/15"
output:
  html_document:
    keep_md: yes
---

getdata-034_project  

run_analyis.R will create a combined table from the UCI HAR Dataset.  The script needs to be placed in the same directory
as the UCI HAR Dataset folder.  
  
The script requires the "dplyr" and "data.table" packages installed in the R session.  The output of the
run_analysis.R script is a wide tidy dataset titled "tidy_data.txt", which can be read back into R with the following command: 
read.table("tidy_data.txt", header = TRUE).  
  
If you would like more information on the dataset please reference the README.txt located in the UCI HAR Dataset download folder.  The link to the dataset is http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.  
  
The scope of the project required the accessing of the various data files from the UCI HAR Dataset folder with the end result being a tidy data set of the means for each mean or std variable grouped by the subject and activity.  I outline the overall structure of the script below:  
  
##### &nbsp;&nbsp;&nbsp;&nbsp;1. install the needed libraries to execute the script code
##### &nbsp;&nbsp;&nbsp;&nbsp;2. utilize the fread command from the data.table package to read in all relevant data files from the UCI HAR Dataset folder
##### &nbsp;&nbsp;&nbsp;&nbsp;3. I manipulated the data for the train and test data independently.  I did this to add a group column labelled with either train or test.  I have found the more information you can maintain for future use the less you have to recreate later.  The addition of the group column does not change any of the final tidy data set results.
##### &nbsp;&nbsp;&nbsp;&nbsp;3. extract the correct column names from the features.txt file and replace into the train and test data sets
##### &nbsp;&nbsp;&nbsp;&nbsp;4. utilize the select command from the data.table package to choose any column which contains either "mean" or "std".  I did choose to keep all of the columns with mean or std including all of the angle and meanFreq variables.  It is then left to the user of the data to utilize the information most relevant to their analysis.
##### &nbsp;&nbsp;&nbsp;&nbsp;5. use mutate to create and assign the activity based on the integer value from the y_test.txt and y_train.txt files.  The actual activity values are coerced out of the activity_labels.txt file.
##### &nbsp;&nbsp;&nbsp;&nbsp;6. assemble the combined test and train datasets with the subject, activity, and group columns added as the first three columns in the combined data.frame.
##### &nbsp;&nbsp;&nbsp;&nbsp;7. use the group_by and summarise_each commands from the dplyr package to create the tidy_data table. write.table is used to send out the final "tidy_data.txt" file
  
For a more detailed description of the dataset please see the CodeBook.md file in the same GitHub repository.