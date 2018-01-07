## Assignment

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# There is one function that loads and manipulates the data, load_data()
# Although the function is commented, I'll document it here also for the sake of completeness

# I ended up not following the sequence of steps outlined in the assignment because the labels were all provided in the data zip
# activity_labels.txt has the names for each of the 1-6 activity codes (REQUIREMENT 2)
# features.txt has the column names for each of the 1-561 columns (REQUIREMENT 3)
# Therefore, I can use those to handle the requirements 3 and 4

# For merging the data, there were several steps performed on each of the files.
# The "y" file containing the activity IDs (one per row of data) was loaded.
# The "subject" file containing the subject IDs (one per row of data) was loaded.
# The "x" file containing the gathered data was loaded.  This is a fixed width format file with 561 columns of 16-width each.  rep(16, 561) was used to create the column vector for read.fwf()

# The names of the "x" data frame were set to the labels loaded from "features.txt"

# Create a "final" data.frame
#   Column 1 is the constant "TEST" to indicate the data here is from the TEST dataset
#   Column 2 is the numerical test subject ID (range of 1 to 30)
#   Column 3 is the activity name done by lookup of the test_activities into the activity_labels (named "activity" so the rbind later works).  This is requirement 3 from the assignment.
#   Column 4..564 are the data columns, labeled by the feature labels

# After these steps were completed, the columns where joined together using cbind() into a new set for each TRAIN and TEST data sets
# And finally, the two sets were joined using rbind() into one complete set.  (REQUIREMENT 1)

# Once the final set was formed, I used regex to isolate the columns with mean() and std() in the names (actually -mean()- and -std()-) per featuresInfo.txt
# grep() returned the collection of matching column names.  I also wanted columsn 1-3 that have the data set type (TRAIN vs. TEST), the subject, and the activity.
# The column vector was used to narrow the results (REQUIREMENT 4).

# Finally, dplyr, group_by(), and summarise_at() were used to get the column mean() by subject/activity (REQUIREMENT 5)
