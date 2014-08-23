# CodeBook
Vincent CANUEL  
Saturday, August 23, 2014  

This is the CodeBook for the "Getting and Cleaning Data" Course Project assignement. 

### Source

This data set is based on the "Human Activity Recognition Using Smartphones Data Set", available on the UCI Machine Learning Repository (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Here is the original study description :

"*This experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.* 

*The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.*"


### Variables

Original variables are accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

Multiple estimations were made from these signals. In this analysis, we only kept the variables where the following estimations were made : 

* mean(): Mean value
* std(): Standard deviation

### Additional Transformations

In a subsequent process scripted in the *run_analysis.R* file, each of these mean and standard deviation measurements variables were averaged for each activity and each subject.

The variable names were also harmonized to follow the lower Camel Case convention (see the README file for more information).

### Variables description

The `activityType` variable is a factor build from the original activity data and labels, that represents the type of activity performed during measurements. This variable that can take 6 different values. Here is the frequency table in the tidy dataset :

```
## 
##            WALKING   WALKING_UPSTAIRS WALKING_DOWNSTAIRS 
##                 30                 30                 30 
##            SITTING           STANDING             LAYING 
##                 30                 30                 30
```

The following tables give for each other variable its class (on the first line) and main attributes (min, max, etc.). 


|        |subjectId |
|:-------|:---------|
|        |integer   |
|Min.    |1         |
|1st Qu. |8         |
|Median  |15.5      |
|Mean    |15.5      |
|3rd Qu. |23        |
|Max.    |30        |


|        |tBodyAccMeanX |tBodyAccMeanY |tBodyAccMeanZ |tBodyAccStdX |tBodyAccStdY |
|:-------|:-------------|:-------------|:-------------|:------------|:------------|
|        |numeric       |numeric       |numeric       |numeric      |numeric      |
|Min.    |0.222         |-0.0405       |-0.153        |-0.996       |-0.99        |
|1st Qu. |0.271         |-0.02         |-0.112        |-0.98        |-0.942       |
|Median  |0.277         |-0.0173       |-0.108        |-0.753       |-0.509       |
|Mean    |0.274         |-0.0179       |-0.109        |-0.558       |-0.46        |
|3rd Qu. |0.28          |-0.0149       |-0.104        |-0.198       |-0.0308      |
|Max.    |0.301         |-0.00131      |-0.0754       |0.627        |0.617        |


|        |tBodyAccStdZ |tGravityAccMeanX |tGravityAccMeanY |tGravityAccMeanZ |tGravityAccStdX |
|:-------|:------------|:----------------|:----------------|:----------------|:---------------|
|        |numeric      |numeric          |numeric          |numeric          |numeric         |
|Min.    |-0.988       |-0.68            |-0.48            |-0.495           |-0.997          |
|1st Qu. |-0.95        |0.838            |-0.233           |-0.117           |-0.982          |
|Median  |-0.652       |0.921            |-0.128           |0.0238           |-0.969          |
|Mean    |-0.576       |0.697            |-0.0162          |0.0741           |-0.964          |
|3rd Qu. |-0.231       |0.943            |0.0877           |0.149            |-0.951          |
|Max.    |0.609        |0.975            |0.957            |0.958            |-0.83           |


|        |tGravityAccStdY |tGravityAccStdZ |tBodyAccJerkMeanX |tBodyAccJerkMeanY |tBodyAccJerkMeanZ |
|:-------|:---------------|:---------------|:-----------------|:-----------------|:-----------------|
|        |numeric         |numeric         |numeric           |numeric           |numeric           |
|Min.    |-0.994          |-0.991          |0.0427            |-0.0387           |-0.0675           |
|1st Qu. |-0.971          |-0.961          |0.074             |0.000466          |-0.0106           |
|Median  |-0.959          |-0.945          |0.0764            |0.00947           |-0.00386          |
|Mean    |-0.952          |-0.936          |0.0795            |0.00757           |-0.00495          |
|3rd Qu. |-0.937          |-0.918          |0.0833            |0.0134            |0.00196           |
|Max.    |-0.644          |-0.61           |0.13              |0.0568            |0.0381            |


|        |tBodyAccJerkStdX |tBodyAccJerkStdY |tBodyAccJerkStdZ |tBodyGyroMeanX |tBodyGyroMeanY |
|:-------|:----------------|:----------------|:----------------|:--------------|:--------------|
|        |numeric          |numeric          |numeric          |numeric        |numeric        |
|Min.    |-0.995           |-0.99            |-0.993           |-0.206         |-0.204         |
|1st Qu. |-0.983           |-0.972           |-0.983           |-0.0471        |-0.0895        |
|Median  |-0.81            |-0.776           |-0.884           |-0.0287        |-0.0732        |
|Mean    |-0.595           |-0.565           |-0.736           |-0.0324        |-0.0743        |
|3rd Qu. |-0.223           |-0.148           |-0.512           |-0.0168        |-0.0611        |
|Max.    |0.544            |0.355            |0.031            |0.193          |0.0275         |


|        |tBodyGyroMeanZ |tBodyGyroStdX |tBodyGyroStdY |tBodyGyroStdZ |tBodyGyroJerkMeanX |
|:-------|:--------------|:-------------|:-------------|:-------------|:------------------|
|        |numeric        |numeric       |numeric       |numeric       |numeric            |
|Min.    |-0.0725        |-0.994        |-0.994        |-0.986        |-0.157             |
|1st Qu. |0.0747         |-0.973        |-0.963        |-0.961        |-0.103             |
|Median  |0.0851         |-0.789        |-0.802        |-0.801        |-0.0987            |
|Mean    |0.0874         |-0.692        |-0.653        |-0.616        |-0.0961            |
|3rd Qu. |0.102          |-0.441        |-0.42         |-0.311        |-0.0911            |
|Max.    |0.179          |0.268         |0.477         |0.565         |-0.0221            |


|        |tBodyGyroJerkMeanY |tBodyGyroJerkMeanZ |tBodyGyroJerkStdX |tBodyGyroJerkStdY |tBodyGyroJerkStdZ |
|:-------|:------------------|:------------------|:-----------------|:-----------------|:-----------------|
|        |numeric            |numeric            |numeric           |numeric           |numeric           |
|Min.    |-0.0768            |-0.0925            |-0.997            |-0.997            |-0.995            |
|1st Qu. |-0.0455            |-0.0617            |-0.98             |-0.983            |-0.985            |
|Median  |-0.0411            |-0.0534            |-0.84             |-0.894            |-0.861            |
|Mean    |-0.0427            |-0.0548            |-0.704            |-0.764            |-0.71             |
|3rd Qu. |-0.0384            |-0.049             |-0.463            |-0.586            |-0.474            |
|Max.    |-0.0132            |-0.00694           |0.179             |0.296             |0.193             |


|        |fBodyAccMeanX |fBodyAccMeanY |fBodyAccMeanZ |fBodyAccStdX |fBodyAccStdY |
|:-------|:-------------|:-------------|:-------------|:------------|:------------|
|        |numeric       |numeric       |numeric       |numeric      |numeric      |
|Min.    |-0.995        |-0.989        |-0.989        |-0.997       |-0.991       |
|1st Qu. |-0.979        |-0.954        |-0.962        |-0.982       |-0.94        |
|Median  |-0.769        |-0.595        |-0.724        |-0.747       |-0.513       |
|Mean    |-0.576        |-0.489        |-0.63         |-0.552       |-0.481       |
|3rd Qu. |-0.217        |-0.0634       |-0.318        |-0.197       |-0.0791      |
|Max.    |0.537         |0.524         |0.281         |0.659        |0.56         |


|        |fBodyAccStdZ |fBodyAccJerkMeanX |fBodyAccJerkMeanY |fBodyAccJerkMeanZ |fBodyAccJerkStdX |
|:-------|:------------|:-----------------|:-----------------|:-----------------|:----------------|
|        |numeric      |numeric           |numeric           |numeric           |numeric          |
|Min.    |-0.987       |-0.995            |-0.989            |-0.992            |-0.995           |
|1st Qu. |-0.946       |-0.983            |-0.973            |-0.98             |-0.985           |
|Median  |-0.644       |-0.813            |-0.782            |-0.871            |-0.825           |
|Mean    |-0.582       |-0.614            |-0.588            |-0.714            |-0.612           |
|3rd Qu. |-0.265       |-0.282            |-0.196            |-0.47             |-0.248           |
|Max.    |0.687        |0.474             |0.277             |0.158             |0.477            |


|        |fBodyAccJerkStdY |fBodyAccJerkStdZ |fBodyGyroMeanX |fBodyGyroMeanY |fBodyGyroMeanZ |
|:-------|:----------------|:----------------|:--------------|:--------------|:--------------|
|        |numeric          |numeric          |numeric        |numeric        |numeric        |
|Min.    |-0.99            |-0.993           |-0.993         |-0.994         |-0.986         |
|1st Qu. |-0.974           |-0.984           |-0.97          |-0.97          |-0.962         |
|Median  |-0.785           |-0.895           |-0.73          |-0.814         |-0.791         |
|Mean    |-0.571           |-0.756           |-0.637         |-0.677         |-0.604         |
|3rd Qu. |-0.169           |-0.544           |-0.339         |-0.446         |-0.263         |
|Max.    |0.35             |-0.00624         |0.475          |0.329          |0.492          |


|        |fBodyGyroStdX |fBodyGyroStdY |
|:-------|:-------------|:-------------|
|        |numeric       |numeric       |
|Min.    |-0.995        |-0.994        |
|1st Qu. |-0.975        |-0.96         |
|Median  |-0.809        |-0.796        |
|Mean    |-0.711        |-0.645        |
|3rd Qu. |-0.481        |-0.415        |
|Max.    |0.197         |0.646         |
