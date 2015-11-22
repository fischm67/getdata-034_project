---
title: "CodeBook for Getting and Cleaning Data Project"
author: "Mark Fischer"
date: "Created 11/15/15"
output:
  html_document:
    keep_md: yes
---

```{r, echo=FALSE}
summary(cars)
```

## Project Description
Create an initial dataset, from which a tidy data set will be created.  The creation of the initial dataset will complete the following tasks, not necessarily in this order:  
&nbsp;&nbsp;&nbsp;&nbsp;1. Merges the training and test data to create one data set.  
&nbsp;&nbsp;&nbsp;&nbsp;2. Extracts only the measurements on the mean and standard deviation for each measurement.  
&nbsp;&nbsp;&nbsp;&nbsp;3. Uses descriptive activity names to name the activities in the data set  
&nbsp;&nbsp;&nbsp;&nbsp;4. Appropriately labels the data set with descriptive variable names.  

##Study design and data processing

###Collection of the raw data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' in the UCI Har Dataset for more details. 

###Notes on the original (raw) data 
For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

##Creating the tidy datafile

###Guide to create the tidy data file
The initial dataset requires the following:

- download the zip data file from url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- unpack the UCI HAR Dataset folder and move to desired directory 
- place the run_analysis.R script in the same directory as the UCI HAR Dataset folder 
- Output of the run_analysis.R script will be "tidy_data.txt" 

###Cleaning of the data
The script will combine the test and train datasets, utilizing the included activity and label files to create appropriate column names and accurately labeled activities. For more detailed information on the script please see [https://github.com/fischm67/getdata-034_project/blob/master/README.md]()

##Description of variables in the tiny_data.txt file
tiny_data.txt includes all relevant variables that contain either "mean" or "std".  All variables will have the mean computed grouped by the subject and activity:

 - Dimensions of tidy_data.txt are 180 X 89
 - The variables chosen for this dataset are derived from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. The time domain signals (prefix 't') were captured at a constant rate of 50Hz.  They were then filtered using a median filter and a 3rd order low-pass Butterworth filter with a corner frequency of 20Hz to remove noise.  Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tbodyacc(xyz)mean(std)) and (tgravityacc(xyz)mean(std)) using another low-pass Butterworth filter with a corner frequency of 0.3Hz.
  - The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tbodyaccjerk(xyz)mean(std) and tbodygyrojerk(xyz)mean(std)). Also the magnitude of these 3-dimensional signals were calculated using the Euclidean norm (tbodyaccmagmean(std), tgravityaccmagmean(std), tbodyaccjerkmagmean(std), tbodygyromagmean(std), tbodygyrojerkmagmean(std)).
  - A fast fourier transform (FFT) was applied to some of the signals producing (prefix 'f') fbodyacc(xyz)mean(std), fbodyaccjerk(xyz)mean(std), fbodygyro(xyz)mean(std), fbodyaccjerkmagmean(std), fbodygyromagmean(std), fbodygyrojerkmagmean(std).
  - Variables contained in the dataset are:  
&nbsp;&nbsp;&nbsp;&nbsp;1. group  
&nbsp;&nbsp;&nbsp;&nbsp;2. subject  
&nbsp;&nbsp;&nbsp;&nbsp;3. activity  
&nbsp;&nbsp;&nbsp;&nbsp;4. tbodyacc(xyz) mean and std  
&nbsp;&nbsp;&nbsp;&nbsp;5. tgravityacc(xyz) mean and std  
&nbsp;&nbsp;&nbsp;&nbsp;6. tbodyaccjerk(xyz) mean and std  
&nbsp;&nbsp;&nbsp;&nbsp;7. tbodygyro(xyz) mean and std  
&nbsp;&nbsp;&nbsp;&nbsp;8. tbodygyrojerk(xyz) mean and std  
&nbsp;&nbsp;&nbsp;&nbsp;9. tbodyaccmag mean and std  
&nbsp;&nbsp;&nbsp;&nbsp;10. tgravityaccmag mean and std  
&nbsp;&nbsp;&nbsp;&nbsp;11. tbodyaccjerkmag mean and std  
&nbsp;&nbsp;&nbsp;&nbsp;12. tbodygyromag mean and std  
&nbsp;&nbsp;&nbsp;&nbsp;13. tbodygyrojerkmag mean and std  
&nbsp;&nbsp;&nbsp;&nbsp;14. fbodyacc(xyz) mean and std  
&nbsp;&nbsp;&nbsp;&nbsp;15. fbodyaccmeanfreq(xyz) mean  
&nbsp;&nbsp;&nbsp;&nbsp;16. fbodyaccjerk(xyz) mean and std  
&nbsp;&nbsp;&nbsp;&nbsp;17. fbodyaccjerkmeanfreq(xyz) mean  
&nbsp;&nbsp;&nbsp;&nbsp;18. fbodygyro(xyz) mean and std  
&nbsp;&nbsp;&nbsp;&nbsp;19. fbodygyromeanfreq(xyz) mean  
&nbsp;&nbsp;&nbsp;&nbsp;20. fbodyaccmag mean and std  
&nbsp;&nbsp;&nbsp;&nbsp;21. fbodyaccmagmeanfreq mean  
&nbsp;&nbsp;&nbsp;&nbsp;22. fbodyaccjerkmag mean and std  
&nbsp;&nbsp;&nbsp;&nbsp;23. fbodyaccjerkmagmeanfreq mean  
&nbsp;&nbsp;&nbsp;&nbsp;24. fbodygyromag mean and std  
&nbsp;&nbsp;&nbsp;&nbsp;25. fbodygyromagmeanfreq mean  
&nbsp;&nbsp;&nbsp;&nbsp;26. fbodygyrojerkmag mean and std  
&nbsp;&nbsp;&nbsp;&nbsp;27. fbodygyrojerkmagmeanfreq mean  
&nbsp;&nbsp;&nbsp;&nbsp;28. angletbodyaccmeangravity  
&nbsp;&nbsp;&nbsp;&nbsp;29. angletbodyaccjerkmeangravity  
&nbsp;&nbsp;&nbsp;&nbsp;30. angletbodygyromeangravity  
&nbsp;&nbsp;&nbsp;&nbsp;31. angletbodygyrojerkmeangravity  
&nbsp;&nbsp;&nbsp;&nbsp;32. angle(xyz)gravity mean
  - Notes:  
&nbsp;&nbsp;&nbsp;&nbsp;- Features are normalized and bounded within [-1,1].  
&nbsp;&nbsp;&nbsp;&nbsp;- Each feature vector is a row on the text file.  
&nbsp;&nbsp;&nbsp;&nbsp;- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).  
&nbsp;&nbsp;&nbsp;&nbsp;- The gyroscope units are rad/seg.  
&nbsp;&nbsp;&nbsp;&nbsp;- The jerk construct of a variable is the derivative of acceleration with respect to time.  

###Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.

Some information on the variable including:
 - Class of the variable
 - Unique values/levels of the variable
 - Unit of measurement (if no unit of measurement list this as well)
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels). 

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

##Sources
Sources you used if any, otherise leave out.
