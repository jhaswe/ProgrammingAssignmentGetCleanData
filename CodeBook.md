Code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.
 
Study design:

Data was obtained from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Further details in README.md

Codebook:

Variables in tidy data set are as follows:
    -subject
    -activity
    -66 feature mean and std variables that have been averaged 

Information on features are included in the features_info.txt file

Transformations:

The run_analysis.R script performs the following transforms on datasets held in the UCI HAR Dataset folder. To run the script you must feed in the directory of where the UCI HAR Dataset folder is contained.

Imported datasets from UCI HAR Dataset were as follows:
    -feature labels
    -activity set for training and test
    -subject set for training and test
    -training sets
    -test sets
    
For the Training set then the test set the following steps are taken:
    -column names set to be the feature labels dataframe
    -subject and activity sets column binded to the front of the set
    -the subject and activity columns given names

Using rbind the training and test sets are merged together
using grepl the dataframe is filtered to keep only the columns of mean and std not vector signal averages and the id columns of subject and activity

Imported the activitys labels set and used this set to to name the activities in the data set by matching on a common column id.

Final step for tidy data is to use the pipeline operator to group the set by subject and activity and summarize the data by averaging all the variables in the columns.
