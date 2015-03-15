# Rob Rolleston
# Coursera Data SCience Specialization
# Getting and Cleaning Data - Final Project
# https://class.coursera.org/getdata-012 

library(dplyr)
### Step-0 : Read the data sets into dplry tbl_df

# Get some basic information about the data files
# See http://www.ats.ucla.edu/stat/r/modules/raw_data.htm 
cat("reading data files....")
dirRoot <- "./UCI HAR Dataset"

fileActivityList <- paste(dirRoot, "activity_labels.txt", sep="/")
fileFeatureList <- paste(dirRoot, "features.txt", sep="/")
dataActivityList <- tbl_df(read.table(fileActivityList,  stringsAsFactors = F))
cat(".")
dataFeatureList <- tbl_df(read.table(fileFeatureList,  stringsAsFactors = F))

dirTst <- paste(dirRoot, "test", sep="/")
fileTestFeatures <- paste(dirTst, "X_test.txt", sep="/")
fileTestSubjects <- paste(dirTst, "subject_test.txt", sep="/")
fileTestActivities <- paste(dirTst, "y_test.txt", sep="/")
cat(".")
dataTestFeatures <- tbl_df(read.table(fileTestFeatures,  stringsAsFactors = F))
cat(".")
dataTestSubjects <- tbl_df(read.table(fileTestSubjects,  stringsAsFactors = F))
cat(".")
dataTestActivities <- tbl_df(read.table(fileTestActivities, stringsAsFactors = F))
cat("..")

dirTrn <- paste(dirRoot, "train", sep="/")
fileTrainFeatures <- paste(dirTrn, "X_train.txt", sep="/")
fileTrainSubjects <- paste(dirTrn, "subject_train.txt", sep="/")
fileTrainActivities <- paste(dirTrn, "y_train.txt", sep="/")
cat(".")
dataTrainFeatures <- tbl_df(read.table(fileTrainFeatures,  stringsAsFactors = F))
cat(".")
dataTrainSubjects <- tbl_df(read.table(fileTrainSubjects,  stringsAsFactors = F))
cat(".")
dataTrainActivities <- tbl_df(read.table(fileTrainActivities, stringsAsFactors = F))
cat("..")

dirTstSig <- paste(dirTst, "Inertial Signals", sep="/")
fileTestBAX <- paste(dirTstSig, "body_acc_x_test.txt", sep="/")
fileTestBAY <- paste(dirTstSig, "body_acc_y_test.txt", sep="/")
fileTestBAZ <- paste(dirTstSig, "body_acc_z_test.txt", sep="/")
fileTestBGX <- paste(dirTstSig, "body_gyro_x_test.txt", sep="/")
fileTestBGY <- paste(dirTstSig, "body_gyro_y_test.txt", sep="/")
fileTestBGZ <- paste(dirTstSig, "body_gyro_z_test.txt", sep="/")
fileTestTAX <- paste(dirTstSig, "total_acc_x_test.txt", sep="/")
fileTestTAY <- paste(dirTstSig, "total_acc_y_test.txt", sep="/")
fileTestTAZ <- paste(dirTstSig, "total_acc_z_test.txt", sep="/")
cat(".")
dataTestBAX <- tbl_df(read.table(fileTestBAX, stringsAsFactors = F))
dataTestBAY <- tbl_df(read.table(fileTestBAY, stringsAsFactors = F))
dataTestBAZ <- tbl_df(read.table(fileTestBAZ, stringsAsFactors = F))
cat(".")
dataTestBGX <- tbl_df(read.table(fileTestBGX, stringsAsFactors = F))
dataTestBGY <- tbl_df(read.table(fileTestBGY, stringsAsFactors = F))
dataTestBGZ <- tbl_df(read.table(fileTestBGZ, stringsAsFactors = F))
cat(".")
dataTestTAX <- tbl_df(read.table(fileTestTAX, stringsAsFactors = F))
dataTestTAY <- tbl_df(read.table(fileTestTAY, stringsAsFactors = F))
dataTestTAZ <- tbl_df(read.table(fileTestTAZ, stringsAsFactors = F))
cat("..")

dirTrnSig <- paste(dirTrn, "Inertial Signals", sep="/")
fileTrainBAX <- paste(dirTrnSig, "body_acc_x_train.txt", sep="/")
fileTrainBAY <- paste(dirTrnSig, "body_acc_y_train.txt", sep="/")
fileTrainBAZ <- paste(dirTrnSig, "body_acc_z_train.txt", sep="/")
fileTrainBGX <- paste(dirTrnSig, "body_gyro_x_train.txt", sep="/")
fileTrainBGY <- paste(dirTrnSig, "body_gyro_y_train.txt", sep="/")
fileTrainBGZ <- paste(dirTrnSig, "body_gyro_z_train.txt", sep="/")
fileTrainTAX <- paste(dirTrnSig, "total_acc_x_train.txt", sep="/")
fileTrainTAY <- paste(dirTrnSig, "total_acc_y_train.txt", sep="/")
fileTrainTAZ <- paste(dirTrnSig, "total_acc_z_train.txt", sep="/")
cat(".")
dataTrainBAX <- tbl_df(read.table(fileTrainBAX, stringsAsFactors = F))
dataTrainBAY <- tbl_df(read.table(fileTrainBAY, stringsAsFactors = F))
dataTrainBAZ <- tbl_df(read.table(fileTrainBAZ, stringsAsFactors = F))
cat(".")
dataTrainBGX <- tbl_df(read.table(fileTrainBGX, stringsAsFactors = F))
dataTrainBGY <- tbl_df(read.table(fileTrainBGY, stringsAsFactors = F))
dataTrainBGZ <- tbl_df(read.table(fileTrainBGZ, stringsAsFactors = F))
cat(".")
dataTrainTAX <- tbl_df(read.table(fileTrainTAX, stringsAsFactors = F))
dataTrainTAY <- tbl_df(read.table(fileTrainTAY, stringsAsFactors = F))
dataTrainTAZ <- tbl_df(read.table(fileTrainTAZ, stringsAsFactors = F))
cat("..")

# Do some clean-up
remove(fileActivityList,fileFeatureList)
remove(fileTrainFeatures, fileTrainSubjects, fileTrainActivities, dirTrn)
remove(fileTestFeatures, fileTestSubjects, fileTestActivities, dirTst)
remove(fileTestBAX,fileTestBAY,fileTestBAZ,
       fileTestBGX,fileTestBGY,fileTestBGZ, 
       fileTestTAX,fileTestTAY,fileTestTAZ,dirTstSig)
remove(fileTrainBAX,fileTrainBAY,fileTrainBAZ, 
       fileTrainBGX,fileTrainBGY,fileTrainBGZ, 
       fileTrainTAX,fileTrainTAY,fileTrainTAZ,dirTrnSig)
cat("....done \n")
###-------------Part-1----------------###
### Merge the training and test sets  ###
###-----------------------------------###
# The initial data set has both 'test' and 'trainging' data.
# The merged data set (e.g. 'both'), will be a rowbind of each data set
# 
cat("Doing part-1, merge data sets....")
# Create new directory (if it does not already exist)
dirBoth <- paste(dirRoot, "both", sep="/")
if (!file.exists(dirBoth)) {
  dir.create(dirBoth)
}
# Bind and write files (NOTE: more descriptive names, and .csv extension)
dataBothFeatures <- bind_rows(dataTestFeatures, dataTrainFeatures)
dataBothSubjects <- bind_rows(dataTestSubjects, dataTrainSubjects)
dataBothActivities <- bind_rows(dataTestActivities, dataTrainActivities)
cat(".")
write.csv(dataBothFeatures, paste(dirBoth, "features.csv", sep="/"))
cat(".")
write.csv(dataBothSubjects, paste(dirBoth, "subjects.csv", sep="/"))
cat(".")
write.csv(dataBothActivities, paste(dirBoth, "activities.csv", sep="/"))
cat("..")

# Create new directory (if it does not already exist)
dirBothInertialSignals <- paste(dirBoth, "Inertial Signals", sep="/")
if (!file.exists(dirBothInertialSignals)) {
  dir.create(dirBothInertialSignals)
}
# Bind and write files (NOTE: siialr file names, and .csv extension)
dataBothBAX <- bind_rows(dataTestBAX, dataTrainBAX)
dataBothBAY <- bind_rows(dataTestBAY, dataTrainBAY)
dataBothBAZ <- bind_rows(dataTestBAZ, dataTrainBAZ)
dataBothBGX <- bind_rows(dataTestBGX, dataTrainBGX)
dataBothBGY <- bind_rows(dataTestBGY, dataTrainBGY)
dataBothBGZ <- bind_rows(dataTestBGZ, dataTrainBGZ)
dataBothTAX <- bind_rows(dataTestTAX, dataTrainTAX)
dataBothTAY <- bind_rows(dataTestTAY, dataTrainTAY)
dataBothTAZ <- bind_rows(dataTestTAZ, dataTrainTAZ)
cat(".")
write.csv(dataBothBAX, paste(dirBothInertialSignals, "body_acc_x_both.csv", sep="/"))
write.csv(dataBothBAY, paste(dirBothInertialSignals, "body_acc_y_both.csv", sep="/"))
write.csv(dataBothBAZ, paste(dirBothInertialSignals, "body_acc_z_both.csv", sep="/"))
cat(".")
write.csv(dataBothBGX, paste(dirBothInertialSignals, "body_gyro_x_both.csv", sep="/"))
write.csv(dataBothBGY, paste(dirBothInertialSignals, "body_gyro_y_both.csv", sep="/"))
write.csv(dataBothBGZ, paste(dirBothInertialSignals, "body_gyro_z_both.csv", sep="/"))
cat(".")
write.csv(dataBothTAX, paste(dirBothInertialSignals, "total_acc_x_both.csv", sep="/"))
write.csv(dataBothTAY, paste(dirBothInertialSignals, "total_acc_y_both.csv", sep="/"))
write.csv(dataBothTAZ, paste(dirBothInertialSignals, "total_acc_z_both.csv", sep="/"))

# Do some clean-up
remove(dataTestFeatures, dataTrainFeatures, 
       dataTestSubjects, dataTrainSubjects,
       dataTestActivities, dataTrainActivities)
remove(dataTestBAX, dataTestBAY, dataTestBAZ,
       dataTestBGX, dataTestBGY, dataTestBGZ,
       dataTestTAX, dataTestTAY, dataTestTAZ)
remove(dataTrainBAX, dataTrainBAY, dataTrainBAZ,
       dataTrainBGX, dataTrainBGY, dataTrainBGZ,
       dataTrainTAX, dataTrainTAY, dataTrainTAZ)
cat("....done \n")

###--------Part-2 & 4-----------------###
###    (2) Extract Selected measures  ###
###    (4) Apply labels to columns    ###
###-----------------------------------###
cat("Doing parts-2 & 4; extracting and labeling data....")
# All the data in 'Inertial Signals' is not needed, so clean-up
remove(dataBothBAX, dataBothBAY, dataBothBAZ,
       dataBothBGX, dataBothBGY, dataBothBGZ,
       dataBothTAX, dataBothTAY, dataBothTAZ,
       dirBothInertialSignals)
# Need to add column labels, taken from 'dataFeatureList$V2', to 'dataBothFeatures'
# and keep only the columns wich contain the strings 'mean()' 'meanFreq()' and 'std()'
# Since there are duplicate names (for values which we do not need) delete the names
# from featureNamesList and the columns from dataBothFeatures
tmpList <- dataFeatureList[,2]
dupIndx <- which(duplicated(tmpList) | duplicated(tmpList[nrow(tmpList):1, ])[nrow(tmpList):1])
dataFeatureList <- dataFeatureList[-dupIndx,]
dataBothFeatures <- dataBothFeatures[,-dupIndx]
colnames(dataBothFeatures) <- as.vector(dataFeatureList$V2)
# Keep only the columns wich contain the strings 'mean()' 'meanFreq()' and 'std()'
# Do this by matching on a regular expression
dataMeanSD <- select(dataBothFeatures, matches("mean()|meanFreq()|std()"))

# Clean-up
remove(tmpList, dupIndx, dataBothFeatures, dataFeatureList)
cat("....done \n")

###--------Part-3---------------###
### Add activity names to rows  ###
### (Add subject ID to rows)    ###
###-----------------------------###
cat("Doing part-3; Adding activty (& subjectS) to rows....")

# Apply the activity ID from dataBothActivties to the rows of dataMeanSD
# Then change the ID from a number to the activity name taken from dataActivityLisy
dataActivityList <- rename(dataActivityList, activeID = V1, activity=V2)
dataBothActivities <- rename(dataBothActivities, activeID = V1 )
dataBothActivities <- left_join(dataBothActivities, dataActivityList, by="activeID")
dataActivityMeanSD <- bind_cols(dataBothActivities[,"activity"], dataMeanSD)

dataBothSubjects <- rename(dataBothSubjects, subject = V1)
dataSubActMeanSD <- bind_cols(dataBothSubjects, dataActivityMeanSD) %>% arrange(subject, activity)

#clean-up
remove(dataMeanSD, dataActivityList, dataBothActivities, dataActivityMeanSD, dataBothSubjects)
cat("....done \n")

###--------Part-5-------------###
###    Create tidy data set   ###
###---------------------------###
cat("Doing part-5; Creating and writing tidy data....")

# dataSubActMeanSd now has columns
#       subject, activity, tBodyAcc-man()-X:angle(Z,gravityMean)
# Not quite sure what step 5 is requesting.....
# I'm guessing a record with three values
#       subject, activity, average(3:ncol(dataSubActMeanSD))
dataSubActAvg <- tbl_df(data.frame(stringsAsFactors = FALSE,
                        subject=dataSubActMeanSD$subject, 
                        activity=dataSubActMeanSD$activity, 
                        average=rowMeans(dataSubActMeanSD[,-2])))

# Write the final tidy data to a .CSV file
write.table(dataSubActAvg, paste(dirBoth, "finalTidyData.csv", sep="/"),
            sep=",", row.names=FALSE) 

# clean-up
remove (dirRoot, dataSubActMeanSD )
cat("....done \n")

cat("Tidy data is in environment data frame dataSubActAvg\n")
cat(paste("Tidy data file is: ", dirBoth, "/finalTidyData.csv\n", sep=""))
remove(dirBoth)
cat("Complete\n")
