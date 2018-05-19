#This script load the data from the coursera programming assingment
# and process it to produce a tidy dataset

# Part 1 : loading and merging the data
#load training data
X_train <- read.table("./train/X_train.txt")
#load training labels
y_train <- read.table("./train/y_train.txt")
#load test data
X_test <- read.table("./test/X_test.txt")
#load training labels
y_test <- read.table("./test/y_test.txt")
#load subject train
subj_train <- read.table("./train/subject_train.txt")
#load subject test
subj_test <- read.table("./test/subject_test.txt")
#load features
features <- read.table("./features.txt")
# load activity labels
activity <- read.table("./activity_labels.txt")

# merging data 
data <- rbind(X_train, X_test)
subject <- rbind(subj_train, subj_test)
data <- cbind(subject, data)
#merging labels
labels <- rbind(y_train, y_test)
data <- cbind(data, labels)
#Part 2 : Extracts only the measurements on the mean and standard deviation
#retrieve only the columns that contains mean and std
remaining_columns_id <- grep("mean|std", features[, 2])
remaining_columns_name <- grep("mean|std", features[, 2], value = TRUE)
# keep only the retrieved columns
data <- data[, c(1, remaining_columns_id +1 , 563)]

#Part 3 : assigning description to activities
data[, 81] <- as.factor(data[,81])
levels(data[, 81]) <- activity[, 2]

#Part 4 : labeling each column. We will use the columns names from features
names(data) <- c("Subject", remaining_columns_name, "Activity")

#Part 5 : mean of each column by subject and activity
data_means <- aggregate(data[2,80], list(data$Subject, data$Activity), mean)
