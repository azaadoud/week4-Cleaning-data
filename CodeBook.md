# Introduction
The script run_analysis.R aims to to process the dataset "Human Activity Recognition Using Smartphones" and process it in order to create a tidy dataset. The data was obtained from : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# The files 
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

# The variables 
- "data" : the final tidy dataset
- "X_train" : data as loaded from X_train.txt 
- "y_train" : data as loaded from y_test.txt
- "features" : data as loaded from features.txt
- "remaining_columns_id" : contain all the Ids of the columns containing the mean or std
- "subj_test" : as loaded from subject_test.txt
- "subject" : subj_test and subj_train row combined
- "activity" : data as loaded from activity_labels                              
- "data_means" : dataset containg the mean of each column by Subject and Activity                          
- "labels" : y_train and y_test row combined                  
- "remaining_columns_name" : contain all the names of the columns containing the mean or std                                         
- "X_test" : data as loaded from X_test.txt
- "y_test" : data as loaded from y_test.txt                 

# The processing 
The processing of the data followed these steps :
1. Loading and merging the data
- Load the data using read.table()
- Merge the data using cbind() and rbind()

2. Extract only the measurements of the mean and std
- Indentify the feeatures to be keeped using grep() and looking for column names containing mean and std
- Filter the data to keep only the needed columns

3. Assigning description to activities
 - Change the type of the column to factor
 - Assign the descriptive values to each value
 
 4. Label each column using the columns found in step 2
 
 5. Create a new data set with the mean of each column by Subject and Activity using the function aggregate()
