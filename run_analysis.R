library(reshape2)
test <- function(){
  fileslist<-list.files(pattern = ".txt")
  for(i in 1: length(fileslist))
  {
    input <- fileslist[i]
    output <- paste0(gsub("\\.txt$",".csv",input))
    data<-read.table(input,header = FALSE)
    write.csv(data, file = output,row.names = FALSE)
  }
  x_test <- read.csv("X_test.csv")
  y_test <- read.csv("y_test.csv")
  subject_test <- read.csv("subject_test.csv")
  names(subject_test) <- "Subject_ID"
  names(x_test) <- feature_name$V2
  names(y_test) <- "activity"
  test_dataSet <- cbind(x_test,y_test,subject_test)
  write.csv(test_dataSet,file = "test_dataset.csv")
  # return(test_dataSet)
}
train <- function(){
  fileslist<-list.files(pattern = ".txt")
  for(i in 1: length(fileslist))
  {
    input <- fileslist[i]
    output <- paste0(gsub("\\.txt$",".csv",input))
    data<-read.table(input,header = FALSE)
    write.csv(data, file = output,row.names = FALSE)
  }
  x_train <- read.csv("X_train.csv")
  y_train <- read.csv("y_train.csv")
  subject_train <- read.csv("subject_train.csv")
  names(subject_train) <- "Subject_ID"
  names(x_train) <- feature_name$V2
  names(y_train) <- "activity"
  train_dataSet <- cbind(x_train,y_train,subject_train)
  write.csv(train_dataSet,file = "train_dataset.csv")
  # return(train_dataSet)
}
## Changing the directory to read feature_names
setwd("~/UCI HAR Dataset")
feature_name<- read.table("features.txt")
## Changing the directory to read test files
setwd("~/UCI HAR Dataset/test")
test()
## Changing the directory to read train files
setwd("~/UCI HAR Dataset/train")
train()

## Merges the training and the test sets to create one data set

combined_dataSet <- rbind(test_dataSet,train_dataSet)
write.csv(combined_dataSet,file = "combined_dataSet.csv")

## Extracts only the measurements on the mean and standard deviation for each measurement.
MeanStd<-combined_dataSet[,grepl("mean\\(\\)",names(combined_dataSet_1))|grepl("std\\(\\)",names(combined_dataSet_1))]

##Uses descriptive activity names to name the activities in the data set
##Appropriately labels the data set with descriptive variable names.

combined_dataSet$activity <- factor(combined_dataSet$activity,labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
melted <- melt(combined_dataSet, id=c("Subject_ID","activity"))
tidy <- dcast(melted, Subject_ID+activity ~ variable, mean)

## Tidy data set
write.csv(tidy,file = "tidy.csv")

  
  