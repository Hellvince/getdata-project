getdata-project
===============

# Course project for "Getting and Cleaning Data" on Coursera

## General description

The run_analysis.R file contains all the required code to complete the Course Project assignement. This file, and the subsequent analysis process, is structured as follows : 

1. Part 1 : Getting data
2. Part 2 : Basic data loading / merging / cleaning (fulfills the Step 1 and 4)
3. Part 3 : Extracting measurements (fulfills the Step 2)
4. Part 4 : Cleaning variables names (fulfills the Step 3)
5. Part 5 : Creating a tidy dataset (fulfills the Step 5)

## Analyis - Part 1 : Getting data

Original data file is downloaded from the given URL (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzipped. As the original file and the decompressed files are not stored on this GitHub repository (files are too large), this step enables future reproducibility.

## Analysis - Part 2 : Basic data loading/merging/cleaning

The test/train data are loaded and merged using a custom `readMerge()` function created for this assignement. We end up with 3 distincts dataframes called `features`, `activities` and `subjects` containing the merged test/train data for features, activity and subject ID, respectively.

Before merging them all, we load the features labels and apply them to `features` columns names.  We also load the activity labels and use them to create an appropriatedly labelled factor in the `activities` dataframe.

The 3 distinct dataframes are then merged into a single `complete` dataframes, containing all the features, activities and subject ID data.

## Analysis - Part 3 : Extracting measurements

Following the *features_info.txt* description, the `grep()` function is used to grab the `complete` columns containing the `-mean()-` or `-std()-` strings.  

By using `-mean()-` and not simply `mean`, we get only variables reporting actual mean measurement ( = using the mean() function). Had the `mean` string be used, we would have grab variables containing other kind of measurements, like `fBodyBodyAccJerkMag-meanFreq()` which uses the meanFreq() function or `angle(tBodyAccMean,gravity)` which is an angle value.

A `filtered` datasets is then created, containing these specific columns (+ the columns containing the activity type and subject ID). 

## Analysis - Part 4 : Cleaning variables names

Original variables labels do not follow usual conventions : camel case and dashed are mixed, names contain parentheses `()`. Moreover, some variable names are misspelled and contain the string `Body` twice (i.e. `fBodyBodyGyroMag-mean()`).

To harmonize variables names, the lower Camel Case convention is used (http://c2.com/cgi/wiki?LowerCamelCase).

The `gsub()` function is used to fix variables names : 

+ Dashes `-` and parentheses `()` are eliminated
+ `mean` and `std` are replaced with `Mean` and `Std`
+ misspellings are fixed.

No further modifications are applied to variables names, to keep them as close as possible from the original ones.


## Analysis - Part 5 : Creating a tidy dataset

The `reshape2` package is used to :

+ Melt the `filtered` dataframe into a long format dataframe, using the `subjectId` and `activityType` as keys.
+ Recast it into a wide format dataframe, while applying the `mean()` function to each measurements variable.

We get a tidy dataset containing the average of each variable contained in `filtered`, for each activity and each subject.  This resulting tidy dataset is exported using the `write.table()` function.