run_analysis <- function(dir2){
########Steps

####Before merging first read in all the files.
    
    ##Get labels for features aka columns\variable names of test and train files    
    print('getting feature label sets, training then test')
    dir <- paste0(dir2,"\\UCI HAR Dataset\\features.txt")
    setlabels <- read.table(dir, sep = "")
    print(dim(setlabels))
    ## Activity Labels for rows of training and test sets
    dir <- paste0(dir2,"\\UCI HAR Dataset\\train\\y_train.txt")
    TrainingActlabels <- read.table(dir, sep = "")
    dir <- paste0(dir2,"\\UCI HAR Dataset\\test\\y_test.txt")
    TestActlabels <- read.table(dir, sep = "")
    print('getting activity sets, training then test')
    print(dim(TrainingActlabels))
    print(dim(TestActlabels))
    ##

    ##Get subjects of training and test set for each row
    print('getting subject sets, training then test')
    dir <- paste0(dir2,"\\UCI HAR Dataset\\train\\subject_train.txt")
    trainSubSet <- read.table(dir, sep = "")
    print(dim(trainSubSet))
    dir <- paste0(dir2,"\\UCI HAR Dataset\\test\\subject_test.txt")
    testSubSet <- read.table(dir, sep = "")
    print(dim(testSubSet))
    
###Get training sets
    print('Getting training set and matching feature column headers then binding subjects and activities')
    dir <- paste0(dir2,"\\UCI HAR Dataset\\train\\X_train.txt")
    trainingSet1 <- read.table(dir, sep = "")
    print(head(trainingSet1[1:10,1:5]))
    print(dim(trainingSet1))

    ## Set column headers of training set to labels from set labels dataframe aka features.
    colnames(trainingSet1) <- as.character(setlabels[,2])
    ## Now match in subject and activity labels to the rows- 7352
    trainingSet2 <- cbind(trainSubSet,TrainingActlabels,trainingSet1)
    ##rename column names for subject and activity.
    names(trainingSet2)[1:2] <- c("subject","activity")
    print(dim(trainingSet2))
    print(head(trainingSet2[1:10,1:5]))
    
##Now repeat for the test set
    print('Repeat for test sets')
    testdir <- paste0(dir2,"\\UCI HAR Dataset\\test\\X_test.txt")
    testset1 <- read.table(testdir, sep = "")
    print(head(testset1[1:10,1:5]))
    print(dim(testset1))
    
    ## Set column headers of test set to labels from set labels dataframe.
    colnames(testset1) <- as.character(setlabels[,2])    
    ## Now match in subject and activity labels to the rows- 2947 rows
    #rename columns first
    testSet2 <- cbind(testSubSet,TestActlabels,testset1)
    names(testSet2)[1:2] <- c("subject","activity")
    print(dim(testSet2))
    print(head(testSet2[1:10,1:5]))
    
####1-Merges the training and the test sets to create one data set.
    mergedSet <- as.data.frame(rbind(testSet2, trainingSet2))
    #QC
    print(dim(mergedSet))
    print(head(mergedSet[1:10,1:5]))

####2-Extracts only the measurements on the mean and standard deviation for each measurement.

    ##Take MergedSet and filter columns only for Mean and Std signals not vector signal averages
    print('Cut mean and STD columns ')
    mergedSet <- mergedSet[, grepl("subject|activity|mean\\(\\)|std\\(\\)", names(mergedSet))]    
    ##QC 
    print('Check dimensions and then column names and order')
    print(dim(mergedSet))
    print(colnames(mergedSet))
    print(head(mergedSet[1:10,1:5]))

####3-Uses descriptive activity names to name the activities in the data set
    print('Get activities files and match to the activity column')
    dir <- paste0(dir2,"\\UCI HAR Dataset\\activity_labels.txt")
    activityLabels <- read.table(dir, sep = "")
    names(activityLabels)[1:2] <- c("activity","activitylabel")
    print(head(activityLabels))
    print(dim(activityLabels))

    print('Replace activity ids with labels')
    mergedSet$activity <- activityLabels$activitylabel[match(mergedSet$activity,activityLabels$activity)]
    print(head(mergedSet[1:10,c(1:6)]))
    print(dim(mergedSet))

####4-Appropriately labels the data set with descriptive variable names.
    ##This was done before set 1 to allow for easy filtering for mean and std columns
    
####5-From the data set in step 4, creates a second, independent tidy data set 
####with the average of each variable for each activity and each subject.
    ##Tidy rules are:
    #1-Each variable you measure should be in one column
    #2-Each observation of that variable should be in a different row
    #3-there should be one table for each kind of variable
    #4-If you have multiple tables, they should include a column in the table that allows them to be linked.
    
    print("Final step of averaging to ensure tidy data set")

    groupedSet <- mergedSet %>% group_by_(.dots= c('subject','activity')) %>% 
        summarise_all(funs(mean))
    print('write out file to tab delimited text file')
    write.table(groupedSet,paste0(dir2,"\\averageSubjectActivityfile.txt"),sep="\t",row.names=FALSE)
    }