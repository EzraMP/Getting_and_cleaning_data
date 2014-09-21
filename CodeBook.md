Course Project Code Book
------------------------

### Original data set


Data procured for this project were obtained through experiment described in the link below:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Original data can be acquired by downloading file from this link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Script specification

R script included to this project is modifying data in order to achieve final goal, which is separate, tidy data set.
In order to do so the script:

1. Merges both train and test data sets
2. Extracts only mean and standard deviation measurments of the test parameters
3. Adds descriptive names to the columns of data set and performed activities
4. Selects specific data and combines it into independent, tidy data set which is then extracted to a text file

For more information about the script logic please refer to the README.md file.

### Data set transofrmations

Final data set contains 180 observations and 68 columns. 
* First column is named "Subject_ID" and contains unique identification number (integer) of subject taking part in the experiment <1-30>. 
* Second column is named "Activity_Performed" and is a factor variable with names of activities tested during the experiment as levels. They are presented below:
        WALKING
        WALKING_UPSTAIRS
        WALKING_DOWNSTAIRS
        SITTING
        STANDING
        LYING
* Remaining 66 columns represent numeric variables containing average value of means and standard deviations of recorded parameters. They are named in the following manner:
        tBodyAcc-mean()-X         
        tBodyAcc-mean()-Y          
        tBodyAcc-mean()-Z          
        tBodyAcc-std()-X           
        tBodyAcc-std()-Y           
        tBodyAcc-std()-Z           
        tGravityAcc-mean()-X       
        tGravityAcc-mean()-Y      
        tGravityAcc-mean()-Z  



