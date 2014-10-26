#The purpose of this project is to demonstrate one's ability to collect, work with, and 
#clean a data set. The goal is to prepare tidy data that can be used for later analysis

#Set working directory
setwd("e://test2")

#Merge the train tables to a single dataframe called one_train_data_set having 3 columns
subject_train <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
x_train <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
one_train_data_set <- cbind(x_train,subject_train,y_train)

#Merge the test tables to a single dataframe called one_test_data_set having 3 columns
subject_test <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
x_test <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
one_test_data_set <- cbind(x_test,subject_test,y_test)

#Merge the train and test data sets to a new dataframe called total_data_set 
total_data_set  <- rbind(one_train_data_set,one_test_data_set)

#Read the feature information and make it the column names of total_data_set
feature_data_frame  <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")
colnames(total_data_set) <- feature_data_frame[[2]]

#Add column names to the subject_id and feature_trained columns of total_data_set
names(total_data_set)[562:563] <- c("subject_id", "Feature_trained")


# Create a dataframe of columns having mean() as the measurement variable
mean_subset <- total_data_set[,grepl("mean()",colnames(total_data_set),fixed=TRUE)]

#Create a dataframe of columns having std() as the measurement variable
std_subset <-  total_data_set[,grepl("std()",colnames(total_data_set),fixed=TRUE)]

# Merge the subject_id, feature_id , mean and standard data frames to create a new 
# dataframe called total_subset
total_subset <-cbind(total_data_set[562:563],mean_subset, std_subset)

#Read the activity mapping file and add a column to total_subset, mapping the 
#acivitity id to activity name
activity_mapping <-read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
total_subset <- mutate(total_subset,Feature_name = activity_mapping[Feature_trained,2])

#Create an independent tidy data set with the average of each variable for
#each activity and each subject. 
library(dplyr)
group_by_subject <- group_by(total_subset,subject_id,Feature_name)
final <- summarise_each(group_by_subject,funs(mean))

#Create a text file for upload to the course project assignment evaluation
write.table(final, file ="tidy_data.txt",row.name=FALSE)