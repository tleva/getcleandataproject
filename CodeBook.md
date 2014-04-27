Process to produce the tidy data:
1) Read all the original data into R
2) Provide descriptive activity names by merging X_test and y_test with activity_labels.
3) Name the columns of X_test and X_train by using the features.txt file.
4) Merge test and train sets by using cbind and rbind
5) Select only mean() and std() columns
6) Save tidy_data_set_1.txt
7) Calculate mean for each subject-activity pair
8) Save tidy_data_set_2.txt