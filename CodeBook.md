# Code Book
This describes the variables, the data, and the transformations or work performed to clean up the data.

## Data Sources
* Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The following is done in the run_analysis.R script:
* Merged the training and test sets to create one data set.
	* X Sets (X_Test and X_Train) - Test and Training Sets
	* Y Sets (Y_Test and Y_Train) - Test and Training Labels
	* subject(subject_train and subject_test) - Subjects who performed both test and training sets.

* The second part of the script reads the features.txt and extracts only the measurements on the mean and standard deviation for each measurement. 

* Uses the activity names from activity_labels.txt (walking, walkingupstairs, walkingdownstairs, sitting, standing, laying)

* The 4th part of the script appropriately labels the data set with descriptive names.
	* All names (activity and feature names) were converted to lower case.
	* '_' and '()' were also removed.
	* Merges the "features" data set with "activities" (activity labels) and "subject" (subject IDs).
	* The result is a data set with subject IDs, activity names and measurements columns.

* Lastly, the 5th part creates a 2nd independent tidy data set with the mean of each measurement for each acitvity and subject. The result is then saved to a txt file named "tidy_data_with_average".
  
