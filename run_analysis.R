## need to make sure library data.table and dplyr are loaded for this script to work

install.packages("dplyr")
install.packages("data.table")

library(dplyr)
library(data.table)

prog_assign_test_dat <- fread("UCI HAR Dataset/test/X_test.txt")
prog_assign_test_subject <- fread("UCI HAR Dataset/test/subject_test.txt")
prog_assign_test_y <- fread("UCI HAR Dataset/test/y_test.txt")
prog_assign_train_dat <- fread("UCI HAR Dataset/train/X_train.txt")
prog_assign_train_subject <- fread("UCI HAR Dataset/train/subject_train.txt")
prog_assign_train_y <- fread("UCI HAR Dataset/train/y_train.txt")
prog_assign_activity_labels <- fread("UCI HAR Dataset/activity_labels.txt")
prog_assign_col_labels <- fread("UCI HAR Dataset/features.txt")

cur_cols_test <- colnames(prog_assign_test_dat)
cur_cols_train <- colnames(prog_assign_train_dat)
new_cols <- prog_assign_col_labels[[2]]
setnames (prog_assign_test_dat, cur_cols_test, new_cols)
setnames (prog_assign_train_dat, cur_cols_train, new_cols)

test_dat <- select(prog_assign_test_dat, contains("mean"), contains("std"), contains("angle"))  ## selects all cols that contain "mean", "std", or "angle"
train_dat <- select(prog_assign_train_dat, contains("mean"), contains("std"), contains("angle"))  ## selects all cols that contain "mean", "std", or "angle"

activity <- prog_assign_activity_labels[[2]]   ## create's new character vector to then assign the activity in test_y and train_y data.frames

prog_assign_test_subject$V1 <- as.factor(prog_assign_test_subject$V1)        ## coerces column from integer to factor
prog_assign_train_subject$V1 <- as.factor(prog_assign_train_subject$V1)      ## coerces column from integer to factor

prog_assign_test_subject <- rename(prog_assign_test_subject, Subject = V1)   ## renames column from V1 to Subject so that I can start combining
prog_assign_train_subject <- rename(prog_assign_train_subject, Subject = V1) ## renames column from V1 to Subject so that I can start combining

test_front <- data.table(Group="test", prog_assign_test_subject)             ## add first column with Group to subject list
train_front <- data.table(Group="train", prog_assign_train_subject)          ## add first column with Group to subject list

prog_assign_test_y <- mutate(prog_assign_test_y, Activity = activity[V1])    ## creates new activity column in test_y data frame
prog_assign_train_y <- mutate(prog_assign_train_y, Activity = activity[V1])  ## creates new activity column in train_y data frame

prog_assign_test_y <- select(prog_assign_test_y, Activity)                   ## selects the new Activity column and removes the rest
prog_assign_train_y <- select(prog_assign_train_y, Activity)                 ## selects the new Activity column and removes the rest

test_front <- bind_cols(test_front, prog_assign_test_y)                      ## complete the front piece with Group, Subject, and Activity combined
train_front <- bind_cols(train_front, prog_assign_train_y)                   ## complete the front piece with Group, Subject, and Activity combined

test_final <- bind_cols(test_front, test_dat)                                ## add the Group, Subject, Activity columns to the front of test_dat
train_final <- bind_cols(train_front, train_dat)                             ## add the Group, Subject, Activity columns to the front of train_dat

full_dat <- bind_rows(test_final, train_final)                               ## combine test and train datasets for complete tidy data set

tidy_data <- full_dat %>%
    group_by(Subject, Activity) %>%
    summarise_each(funs(min))
