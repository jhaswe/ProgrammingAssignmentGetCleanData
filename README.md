README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

Below is details of the dataset that was obtained and used for a coursera 'Getting and cleaning data' course
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

Information on the data is as follows:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

For each record it is provided:
======================================
- An identifier of the subject who carried out the experiment.
- Its activity label. 
- A 66 feature vector with averaged mean and std time and frequency domain variables. 

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt'-information on the feature variables included in the final dataset averageSubjectActivityfile.txt

- 'CodeBook.md' : Code book that describes the variables, the data, and any transformations or work that you performed to clean up the data to create the final averageSubjectActivityfile.txt dataset.

- run_analysis.R - transforms the data held in UCI HAR Dataset folder

- 'averageSubjectActivityfile.txt': Each row identifies the subject who performed the activity.This ranges from 1 to 30. It also identifies the which of the six activities was performed and shows the average for each feature recorded.These features have been filtered to only show the mean and std feature variables.


