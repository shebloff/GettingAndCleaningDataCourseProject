library(plyr)

#creationg one data set
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# creating x,y and subj sets
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)


#mean and std only
features <- read.table("UCI HAR Dataset/features.txt")
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
x_data <- x_data[, mean_and_std_features]
names(x_data) <- features[mean_and_std_features, 2]

#correct names
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
y_data[, 1] <- activities[y_data[, 1], 2]
names(y_data) <- "activity"
names(subject_data) <- "subject"

# merge all data in one
all_data <- cbind(x_data, y_data, subject_data)
write.table(all_data, "UCI HAR Dataset/all_data.txt", row.name=FALSE)

#second data set with the average of each variable
averages <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages, "UCI HAR Dataset/averages.txt", row.name=FALSE)