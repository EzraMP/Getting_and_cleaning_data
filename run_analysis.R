## Loading required libraries
library(reshape2)

################################################################################################

## 1. Reading necesarry data into R

## [COMMON] Variables' names
features <- read.table("./UCI HAR Dataset/features.txt")

## 1.1 Test set 
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt") ## ID of subjects
test_label <- read.table("./UCI HAR Dataset/test/Y_test.txt") ## Labels of activities performed
test_set <- read.table("./UCI HAR Dataset/test/X_test.txt") ## Acquired data

# Seeting up column names for clarity
colnames(test_subject) <- "Subject_ID" 
colnames(test_label) <- "Activity_Performed"
colnames(test_set) <- features[,2]

## 1.2 Train set

train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt") ## ID of subjects
train_label <- read.table("./UCI HAR Dataset/train/Y_train.txt") ## Labels of activities performed
train_set <- read.table("./UCI HAR Dataset/train/X_train.txt") ## Acquired data

## Setting up column name for clarity
colnames(train_subject) <- "Subject_ID"
colnames(train_label) <- "Activity_Performed"
colnames(train_set) <- features[,2]

## 1.3 Merging Test tables into one
test_table <- cbind(test_subject, test_label, test_set)

## 1.4 Merging Train tables into one (with the same column order as Test table)
train_table <- cbind(train_subject, train_label, train_set)

## 1.5 Merging Test and Train tables into one new dataset
work_set <- rbind(train_table, test_table)

## 1.6 Removing unused data sets
rm(list=(ls()[ls()!="work_set"]))

################################################################################################

## 2. Extracting only mean and standard devation of each measurement

## 2.1 Extraction
stats_set <- work_set[c(1,2,grep("*std|*mean[^Freq]",names(work_set)))]

## 2.2 Removing unused data sets
rm(list=(ls()[ls()!="stats_set"]))

################################################################################################

## 3. Applying descriptive names to peformed activities
stats_set$Activity_Performed <- as.factor(stats_set$Activity_Performed)
labels <- read.table("UCI HAR Dataset/activity_labels.txt")
levels(stats_set$Activity_Performed) <- labels[,2]

################################################################################################

## 4. Reshaping the data

## 4.1 Melting data set
melted <- melt(stats_set, id=c("Subject_ID","Activity_Performed"))

## 4.2 Recasting into required format
final_set <- dcast(melted, Subject_ID+Activity_Performed~variable, mean)

## 4.3 Saving writing into file
write.table(final_set,"tidy_set.txt",row.names=FALSE)

## 4.4 Cleaning unused data excluding tidy and transformed data sets
rm(list=(ls()[ls()!=c("final_set","stats_set")]))
