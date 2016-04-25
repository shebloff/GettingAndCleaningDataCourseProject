#Description

All similar data merged using the rbind() function. 

Then we take only columns with the mean and standard deviation.
After that we named them correctly (from features.txt and activity_labels.txt).

After that we create new dataset with all average measures . The output file is called averages.txt.

##Variables
data from the downloaded files
x_train
y_train
x_test
y_test
subject_train
subject_test

Then merged data is
x_data
y_data
subject_data

mean_and_std_features contains the correct names for the x_data dataset

all_data merges 
x_data
y_data
subject_data

averages contains the relevant averages.