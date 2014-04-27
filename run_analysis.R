## Read labels to R
features <- read.table("data/UCI HAR Dataset/features.txt")
activity_labels <- read.table("data/UCI HAR Dataset/activity_labels.txt")

## Read test set data into R
X_test <- read.table("data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt")

## Read train set data into R
X_train <- read.table("data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt")

# 3. Uses descriptive activity names to name the activities in the data set

y_test_desc <- data.frame(join(y_test, activity_labels)[,2])
y_train_desc <- data.frame(join(y_train, activity_labels)[,2])

## Name the variables
names(X_test) <- features[,2]
names(X_train) <- features[,2]
names(subject_test) <- c("subject")
names(subject_train) <- c("subject")
names(y_test_desc) <- c("activity")
names(y_train_desc) <- c("activity")

# 1. Merges the training and the test sets to create one data set.

## Merge test set and train set
merged_test <- cbind(subject_test, y_test_desc, X_test)
merged_train <- cbind(subject_train, y_train_desc, X_train)
merged_data <- rbind(merged_test,merged_train)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_cols <- grep("mean()", fixed=TRUE, names(merged_data))
std_cols <- grep("std()", fixed=TRUE, names(merged_data))
tidy_data_set_1 <- merged_data[,c(1, 2, sort(c(mean_cols, std_cols)))]

## Save the first tidy data set into file  
write.table(tidy_data_set_1, "tidy_data_set_1.txt")

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_data_set_2 <- aggregate(x = tidy_data_set_1[,3:68], by = list(subject = tidy_data_set_1$subject, activity = tidy_data_set_1$activity), FUN = "mean")

## Save the second tidy data set into a file  
write.table(tidy_data_set_2, "tidy_data_set_2.txt")