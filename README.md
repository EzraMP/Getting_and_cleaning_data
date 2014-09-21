Course Project READ ME
------------------------

### DISCLAIMER

* Please ensure that you have properly set up your working environement before running run_analysis.R script. 

### SETUP AND EXECUTION

1. Download data set from this URL ( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )
2. Set up your working directory in R IDE of your choosing
3. Extract "UCI HAR Dataset" folder into your working directory
4. Paste "run_analysis.R" script into your working directory
5. Type the following command in R console:
        source('run_analysis.R')
6. When script's execution has ended you will find text file called "tidy_set.txt" in your working directory. This text file contains tidy data set created according to Project specification


### SCRIPT LOGIC

Before loading any data, script imports 'reshape' library whose functions will be used during tidy set creation. It then proceedes to the first section.

#### SECTION 1 - IMPORTING AND MERGING DATA

First step is to load variables' names. Next steps are performed for both test and train sets:

1. Read id table,labels table and parameters table.

2. Set up proper column names for each table

3. Merge id table, labels table and parameters table using CBIND

4. Two newly created tables (test_table and train_table) are then merged using RBIND.

5. Finally, all unnecessary data are cleaned from the memory.

#### SECTION 2 - EXTRACTION OF MEAN AND STD.DEVIATION MEASURMENTS

Using regular expression onyl specifiec measurments are selected. They are then joined with "Subject_ID" and "Activity_Performed" columns in order to create another temporary data set.

All unnecessary data are cleaned from the memory.

#### SECTION 3 - APPLYING DESCRIPTIVE NAMES TO ACTIVITIES

1. Second column of the data set created in previous section is changed to factor variable.

2. Proper activity anmes are then loaded to separate varibale from "activity_labels.txt" file.

3. Lastly, new levels of second column are set using imported activities' names.

#### SECTION 4 - RESHAPING THE DATA AND DATA SET EXPORT

1. First step is to melt data set using MELT function with "Subject_ID" and "Activity_Performed" columns as IDs. 

2. Final set is then created by casting new data table (using DCAST function) with means of each measurment for every subject and activity

3. Newly created data set is then written to a text file named "tidy_set.txt"

4. Lastly, every object apart data set from section 3 and newly created one is deleted from the memory

