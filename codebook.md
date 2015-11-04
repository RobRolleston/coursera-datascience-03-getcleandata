#### Data Description / Dictionary

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
            + body\_acc\_[XYZ]_test.txt
            + body\_gyro\_[XYZ]_test.txt
            + total\_acc\_[XYZ]_test.txt
    + train  
    *NOTE:*  Same as the 'test' set, but with 7352 subject/activity rows for each file  
    + **both** *(the merged data set, and tidy data set, e.g. Created for this assignment and mimics that "test" and "train" directories above)*  
    *NOTE:*  10299 = 7352 (from train) + 2947 (from test)
        + activities.csv *(10299 rows of test activity IDs)*  
        **Description** Same as y\_test.txt and y\_train.txt in original data
        + features.csv *(10299x561; row of features for each test subject/activity)*  
        **Description** Same as X\_test.txt and X\_train.txt in original data
        + finalTidyData.txt *(10299x3 rows; each with subject, activity, average)*  
        **NOTE** Only this file was uploaded to the assignment page  
        **Description** 
            + subject: ID of subject; [1,30]
            + activity: type of activity; WALKING, WALKING_UPSTAIRS, ..., LAYING
            + average value of all measures containing the strings "mean()", "meanFreq()", or "std()" in original feature set  
        + subjects.csv *(10299 rows of test subject IDs)*  
        **Description** Same as subject\_test.txt and subject\_train.txt in original data
        + Inertial Signals *(9 files; 10299x128; row of measures for each test subject/actvity )*  
        **Description** Same as "Intertial Signals" in original data
            + body\_acc\_[XYZ]_both.txt
            + body\_gyro\_[XYZ]_both.txt
            + total\_acc\_[XYZ]_both.txt  

