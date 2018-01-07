## Getting and Cleaning Data, Data Science Course 3 Week 4

# This assignment uses data from the following source

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


# Study Design

The data was collected from the above source using the dataset link provided in the assignment

The raw data is in two sets, "train" and "test".  Both sets have the same 561 columns described in feature_info.txt and features.txt in the data set.  The two sets have different row counts.

Each row in each set corresponds to an observation of a test subject (referenced by an ID value in the range of 1 to 30) performing one of six defined actions (listed in activity_labels.txt).

Each data set is comprised of three files, each with the same number of rows:

X_xxx.txt holds the gathered observations, each 561 attributes wide (per features.txt)
y_xxx.txt holds the activity code (1 to 6) for each row in the corresponding observations.
subject_xxx.txt holds the subject ID for each row in the corresponding observations.

xxx can be either "test" or "train", corresponding to the two datasets, TEST and TRAIN, respectively.

# Code Book

type:  Because there are two data sets to merge, "TEST" and "TRAIN", a new column, "type" is added to hold the data set source.
subject_id:  The subject IDs have no lookup to translate them to subject names.  Therefore the IDs remain IDs in the manipulated data.
activity:  The activity IDs can be translated to human-friendly text using the activity_labels.txt file to map ID to label.

The observation data is 561 columns, which are named in features.txt.  Setting the names of the observation data to the vector of strings in features.txt puts meaningful names on the columns.

Narrowing the comprehensive data set to include only mean and standard-deviation observations can be done by only selecting the columns with mean() or std() in the label (per features_info.txt).

The final calculated dataset uses the same column names as the narrow set (subject_id and activity, and mean() and std() from the features.txt list).  "type" is dropped as it isn't a grouping criterion.

