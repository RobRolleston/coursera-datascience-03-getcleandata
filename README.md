## Coursera: [Getting and Cleaning Data](https://class.coursera.org/getdata-034) Final Project
### 2015-November
#### [Rob Rolleston](rob.rolleston@xerox.com)

The complete instructions for the project can be found [here](https://class.coursera.org/getdata-034/human_grading)

In summary:
"You should create one R script called run_analysis.R that does the following. 

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive variable names. 
5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject"

If you clone this repository, then from within R *`source("run_analysis.R")`*, everything should work.  There are progress messages printed at the console, but the first stages take a minute or two to run; be patient.  There are comments in the run_analysis.R file to explain the steps and assumptions.  The two items of note are  

1. combination of steps 2 & 4, as it was more logical to label and extact the necessary data  
2. interpretation of the final tidy data set

#### Files

* README.md *(this markdown file)* 
* run_analyis.R *(the program to complete the assignment.  Running this will produce the additional files within the 'both' data directory.)*
* [codebook.md](https://github.com/RobRolleston/coursera-datascience-03-getcleandata/blob/master/codebook.md) is the Data Dictionary
  

Enjoy, and thank you.
