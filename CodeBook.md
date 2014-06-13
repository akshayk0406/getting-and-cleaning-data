##CodeBook

- This file describes the variables, the data, and any transformations or work that I performed to clean up the data.
- Firstly, data was obtained from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
- run_analysis.R script does the following
	* read X_test.txt,y_test.txt,subject_test.txt from test sub-directory.
	* read X_train.txt,y_train.txt,subject_train.txt from train sub-directory.
	* Concatenate X_test,X_train to from X , y_test,y_train to form Y and subject_test, subject_train to form S
	* Read the features from features.txt file.We only extract the measurements on the mean and standard deviation resulting in a 66 indices list and X is reduced to its subset with only required columns present.
	* Cleaning of column names is done.We remove the "()" and "-" symbols in the names.
	* Next, activity_labels.txt is read and cleaning of names is done i.e names are moved to lowercase and "-" are removed.
	* Combine S,Y,X to get a cleaned data frame(final_data.txt) of dimensions 10299x68. Columns of S are renamed to "subject" and that of Y are renamed to "activity"
	* Now write the newly created frame to final_data.txt
	* Finally, generate second independent data frame with the average of each measurement for each activity and each subject. Since we have 30 subjects and 6 activities we have 180 rows. Then, for each combination, we calculate the mean of each measurement with the corresponding combination
	* Then we write the data-frame to "new_final_data.txt"

