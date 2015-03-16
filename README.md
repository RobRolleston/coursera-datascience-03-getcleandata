## Coursera: [Getting and Cleaning Data](https://class.coursera.org/getdata-012) Final Project
### 2015-March
#### [Rob Rolleston](rob.rolleston@xerox.com)

The complete instuctions for the proejct can be found [here](https://class.coursera.org/getdata-012/human_grading)

In summary:
You should create one R script called run_analysis.R that does the following. 

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive variable names. 
5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

If you clone this repository, then from within R *`source("run_analysis.R")`*, everything should work.  There are progress messages printed at the console, but the first stages take a minute or two to run; be patient.  There are comments in the run_analysis.R file to explain the steps and assumptions.  The two items of note are  

1. combination of steps 2 & 4, as it was more logical to label and extact the necessary data  
2. interpretation of the final tidy data set

#### Data Description

* README.md *(this markdown file)* 
* run_analyis.R *(the program to complete the assignment)*
* UCI HAR Dataset *(the orginal and computed data sets)*
    + README.txt *(Dataset description)*
    + activity_Labels.txt *(6x2 array of activity ID numbers and names)*
    + features.txt *(561x2 array of row numbers and feature names)*
    + features_info.txt *(text description of features)*
    + test
        + X_test.txt *(2947x561; row of features for each test subject/activity)*
        + subject_test.txt *(2947 rows of test subject IDs)*
        + y_test.txt *(2947 rows of test activity IDs)*
        + Interial Signals *(9 files; 2947x128; row of measures for each test subject/actvity )*
            + body\_acc\_[XYX]_test.txt
            + body\_gyro\_[XYX]_test.txt
            + total\_acc\_[XYX]_test.txt
    + train  
    *NOTE:*  Same as the 'test' set, but with 7352 subject/activity rows for each file  
    + **both** *(the merged data set, and tidy data set, e.g. Created for this assignment)*  
    *NOTE:*  10299 = 7352 (from train) + 2947 (from test)
        + activities.csv *(10299 rows of test activity IDs)*
        + features.csv *(10299x561; row of features for each test subject/activity)*
        + finalTidyData.txt *(10299x3 rows; each with subject, activity, average)*  
        **NOTE** Only this file was uplaoded to the assignment page
        + subjects.csv *(10299 rows of test subject IDs)*
        + Inertial Signals *(9 files; 10299x128; row of measures for each test subject/actvity )*
            + body\_acc\_[XYX]_both.txt
            + body\_gyro\_[XYX]_both.txt
            + total\_acc\_[XYX]_both.txt
  

Enjoy, and thank you.