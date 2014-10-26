1) The purpose of this project is to demonstrate one's ability to collect,work with and clean data set. A tidy data set needs to be prepared at the end

2) The steps followed and the variables are explained below :
a) I have set the path to the working directory of the R script
b) one_train_data_set is the dataframe that combines the three training tables, subject, y train and x train.
c)Similary  one_test_data_set is the dataframe that combines the three test tables subject, y test and x test.
d)total_data_set is the dataframe that is formed by combining both the train and test data frames.
f) Currently the columns have no name. Copy the column names to feature_data_frame from the features.txt. Assign the column names to all the measurements in total_data_set.
g) A  "subject_id" and "Feature_trained" to the subject and feature trained column in total_data_set respectively.
h) Create a subset of mean() and std() only variables data frame called mean_subset and std_subset respectively.
i) Create a data frame total_subset having subject_id, feauture_trained_id, mean_subset and std_subset as its columns.
j) Create a column called Feature_Name in total_subbset, by mapping the feature_trained_id with the activity_id using the activity_labels.txt file.
k)Create an new tidy data set grouping by activity name and subject.
l)Create a text file of this tidy data set, so that it can be uploaded for evaluation.

