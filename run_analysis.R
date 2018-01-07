load_data <- function() {
    activity_labels <<- read.delim("data\\activity_labels.txt", header = FALSE, sep = " ", col.names = c("activity_id", "activity_label")) # Map activity ID to text label
    feature_labels <<- read.delim("data\\features.txt", header = FALSE, sep = " ", col.names = c("col_num", "col_name")) # Map column number to textual label

    # Load the TEST data into one data set

    test_activities <<- read.delim("data\\test\\y_test.txt", header = FALSE, sep = " ", col.names = c("activity_id")) # Load the activities, one per data row
    test_subjects <<- read.delim("data\\test\\subject_test.txt", header = FALSE, sep = " ", col.names = c("subject_id"), colClasses = c("factor")) # Load the subjects, one per data row
    test_data <<- read.fwf("data\\test\\x_test.txt", rep(16, 561), header = FALSE) # Load the data, fixed width, 16 characters per column, 561 columns (hence the rep(16, 561))
    names(test_data) = feature_labels[,2] # Rename the data columns by the textual label from features.txt.  This is requirement 4 from the assignment.

    ## This warrants a bit of explain
    # Create a "final" data.frame
    #   Column 1 is the constant "TEST" to indicate the data here is from the TEST dataset
    #   Column 2 is the numerical test subject ID (range of 1 to 30)
    #   Column 3 is the activity name done by lookup of the test_activities into the activity_labels (named "activity" so the rbind later works).  This is requirement 3 from the assignment.
    #   Column 4..564 are the data columns, labeled by the feature labels
    test_set <<- cbind(type = "TEST", test_subjects, activity = sapply(test_activities[,1], function(x) { activity_labels[x,2]}), test_data)

    # Load the TRAIN data into a second data set

    ## Do the same steps from TEST, but for the TRAIN data

    train_activities <<- read.delim("data\\train\\y_train.txt", header = FALSE, sep = " ", col.names = c("activity_id"))
    train_subjects <<- read.delim("data\\train\\subject_train.txt", header = FALSE, sep = " ", col.names = c("subject_id"), colClasses = c("factor"))
    train_data <<- read.fwf("data\\train\\x_train.txt", rep(16, 561), header = FALSE)
    names(train_data) = feature_labels[,2]
    train_set <<- cbind(type = "TRAIN", train_subjects, activity = sapply(train_activities[,1], function(x) { activity_labels[x,2]}), train_data)

    # Merge the two sets into one giant set (requirement 1 from the assignment)

    total_set <<- rbind(train_set, test_set)

    # Narrow the set with only the columns for mean or SD (which the features_info.txt file says are labled as mean() and std())
    # Use grep() to identify the column names with -mean()- and -std()- in them.  We want to carry columns 1..3 along as well, so include them in the collection of columns to reduce to
    # This is requirement 2 from the assignment

    narrow_set <<- total_set[,c(1, 2, 3, grep("\\-mean\\(\\)\\-|\\-std\\(\\)\\-", names(total_set)))]

    library(dplyr)

    ## For each subject_id/activity, get the mean (for columns 2..49 which correspond to the data columns, excluding the type/subject/activity)

    mean_set <<- narrow_set %>% group_by(subject_id, activity) %>% summarise_at(vars(2:49), mean, na.rm = TRUE)
}
