################################################################################
##
##      Title   : "Getting and Cleaning Data" course project
##      Date    : 23/08/2014 
##
##      Info    : Work is divided in multiple part. Read the README.md file on       
##      the GitHub repository (https://github.com/Hellvince/getdata-project) for
##      more details.     
##
################################################################################
library(reshape2)

################################################################################
##
##      PART 1 : Getting data
##
##      WARNING : the ZIP file and decompressed files are not stored on GitHub
##      (too bulky)
##
################################################################################

#Downloading original ZIP file
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              destfile = "getdata-projectfiles-UCI HAR Dataset.zip")

# Decompress the file
unzip("getdata-projectfiles-UCI HAR Dataset.zip")


################################################################################
##
##      PART 2 : Basic loading/merging/cleaning
##
################################################################################

# Custom function to load and merge data
readMerge <- function(file1, file2, ...){
        # Load data
        data1 <- read.table(file1, ...)
        data2 <- read.table(file2, ...)
        
        # Merge data
        rbind(data1, data2)
}

# Load the test and train features data
features <- readMerge(file1 = "./UCI HAR Dataset/test/X_test.txt",
                  file2 = "./UCI HAR Dataset/train/X_train.txt")

# Load the test and train activities data
activities <- readMerge(file1 = "./UCI HAR Dataset/test/y_test.txt", 
                        file2 = "./UCI HAR Dataset/train/y_train.txt",
                        col.names = "activityType")

# Load the test and train subjects ID data
subjects <- readMerge(file1 ="./UCI HAR Dataset/test/subject_test.txt",
                      file2 ="./UCI HAR Dataset/train/subject_train.txt",
                      col.names="subjectId")

# Load the features labels
featuresLabels <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors=F)
featuresLabels <- featuresLabels$V2
# Add the subject ID and activities label to column names
colnames(features) <- featuresLabels

# Load the activities lables
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt",
                               stringsAsFactors=F,
                               col.names = c("levels", "labels"))
# Replace the current activities ID by a factor using labels
activities$activityType <- factor(x = activities$activityType,
                                levels = activityLabels$levels,
                                labels = activityLabels$labels)


# Merge all the datasets into a single one
complete <- cbind(subjects, activities, features)


################################################################################
##
##      PART 3 : Extracting measurements
##
################################################################################

# Scan the complete dataset's labels for means and standard deviation columns
# The pipe combine the two parts like an OR. The \\ are required to escape the 
# left parenthesis
col <- grep("-mean\\()-|-std\\()-", colnames(complete))

# Extract the selected columns + subjects ID and activityType
filtered <- complete[,c(1, 2, col)]


################################################################################
##
##      PART 4 : Appropriately label the data 
##
################################################################################

# Apply the lower camelcase convention by eliminating - and () and capitalizing
# first letter of mean and std
colnames(filtered) <- gsub("-mean\\()-", "Mean", colnames(filtered))        
colnames(filtered) <- gsub("-std\\()-", "Std", colnames(filtered))
colnames(filtered) <- gsub("-|\\()", "", colnames(filtered))
# Fixing mispellings
colnames(filtered) <- gsub("BodyBody", "Body", colnames(filtered))

################################################################################
##
##      PART 5 : Creating a tidy dataset 
##
################################################################################

# Melt the data, than recast it while applying mean() to each variable
tidy <- melt(filtered, id = c("subjectId", "activityType"))
tidy <- dcast(filteredLong, subjectId + activityType ~ variable, mean)

# Output the dataframe
write.table(tidy, "tidy.txt", row.name=FALSE)
