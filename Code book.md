### Code Book
  Code book will give the overview of all variables and data used in the code , also walk us through the process of creating the tidy data set

### Files used to create tidy data set


- **features_info.txt**: Provides information about all 561 features.

- **features.txt**: Labels/Names of 561 features.

- **activity_labels.txt**: Activities performed by 30 volunteers are mentioned as activity labels.

- **X_train.txt**: 7352 observations of the 561 features.

- **y_train.txt**: Activity ID of 7352 observations.

- **subject_train.txt**:Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30

- **X_test.txt**:  2947 observations of the 561 features.

- **y_test.txt**: Activity ID of 2947 observations.

- **subject_test.txt**:Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30


### Files which are not used 

 All the files in the Inertial signals folder of train and test subdirectories were unused 
 
### Walk through 

  * All the "train" and "test" datas are read from respective sub directories and stored in the same sub-directories after converting all txt files to CSV files and Single data set is formed by combing the test and train files using the function cbind() and rbind()
  * Extracting the column names which contains "mean" and "std" 
  * Changing the activity id to respective activity labels using factor() function 
  * Average of each variable for each activity and each subject were found using melt and dcast functions which are available in "reshape2" library 
  * Tidy dataset is written in the current working directory using write.csv function
