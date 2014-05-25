CodeBook
========================================================

## Introduction

This file contains the study design and data dictionary for the tidied dataset produced by `run_analysis.R`.

## Study Design

The following steps where taken to produce the tidied data set:

1. Original data was downloaded and loaded into R. The following files where used as the starting data for the tidied data set:
  * `features.txt`: This file contains the list of features in the data set.
  * `activity_labels.txt`: This file contains the list of activities measured.
  * `y_train.txt` and `y_test.txt`: These files contain the list of activity ids that where measured for each observation. 
  * `X_train.txt` and `X_test.txt`: These files contain the mesured value for each feature during each observation for a particular activity.
  * `subject_train.txt` and `subject_test.txt`: These files contain the id of the subject that was measured for each observation in `X_train.txt` and `X_test.txt`.

2. All training and test data was combined into single datasets, one for observations, activities, and subjects.

3. The set of activity ids was replaced with a set of string labels of the activities 

4. Get a list of mean and sd features from the list of all features. This step only considered the features that end in mean() or std(). The features in the for mean()-[X|Y|Z] or std()-[X|Y|Z] are the values that are used to calculate the mean and std features so can be ignored for this step.

5. Get a set of all observations that just contains the features produced in step 4.

6. Make a new data set from lists of subjects, activities and the observations produced in step 5.

7. Tidy column names by renaming subject and activity columns and removing the '()' at the end of each feature.

8. Walk through each subject/activity duple and calculate the mean of each feature for that duple. Collect results in new dataset called tidy.

9. Dump tidy to csv. File is named with a 'txt' extension because of the upload requirements for the project.

## Data dictionary

The tidied data set consists of the following variables:

* **subject**: Factor variable ranging from 1 to 30 that identifies the subject of the experiment.
 
* **label**: Factor variable that identifies the activity carried out. It can assume the 
following values: 
 * WALKING 
 * WALKING_UPSTAIRS 
 * WALKING_DOWNSTAIRS 
 * SITTING 
 * STANDING 
 * LAYING 
 
* **Feature Means**: Numeric variables that represents the means of the features of the original data set that represented means or standard deviations. Being means, the values are unitless. The specific features are as follows:

 * `tBodyAccMag.mean`
 * `tBodyAccMag.std`
 * `tGravityAccMag.mean`
 * `tGravityAccMag.std`
 * `tBodyAccJerkMag.mean`
 * `tBodyAccJerkMag.std`
 * `tBodyGyroMag.mean`
 * `tBodyGyroMag.std`
 * `tBodyGyroJerkMag.mean`
 * `tBodyGyroJerkMag.std`
 * `fBodyAccMag.mean`
 * `fBodyAccMag.std`
 * `fBodyBodyAccJerkMag.mean`
 * `fBodyBodyAccJerkMag.std`
 * `fBodyBodyGyroMag.mean`
 * `fBodyBodyGyroMag.std`
 * `fBodyBodyGyroJerkMag.mean`
 * `fBodyBodyGyroJerkMag.std`


