##Code Book
This document describes my **run_analysis.R** code.

##R Script Description
The general outline of the code is as follows:
* Set the working directory and load the relevant R packages
* Load and name the data sets into global environment
* Clean up and rename some key data elements
* Merging the data
* Selecting *only* the mean and standard deviation data
* Additional cleaning and labeling
* And then combining into a tidier result **tidy.txt**

NB: The code contains internal notes and comments, incorporated into the script.

Variables:
* trX (Dataset/X_train.txt)
* trY (Dataset/Y_train.txt)
* teX (Dataset/X_test.txt)
* teY (Dataset/Y_test.txt)
* actlabels (Dataset/activity_labels.txt)
* feats (Dataset/features.txt) 
* mergeddata (rbind(trX, teX))

These variables are files that contain measurements from the Samsung Galaxy S accelerometer and gyroscope, as well as the activity label and subject identifiers.

##The Process
I downloaded the data from the public UCI repository and put into my data directory.

Before merging the training and test sets, I cleaned some of the labels for easier readibility and manipulation within RStudio. The resulting data frame of combining the training and test sets (mergeddata) yields 10,299 observations with 561 variables (560 measurements and one subject identifier). 

Once combined, I extracted the observations relevant to mean and standard deviation. .

Next, I applied more descriptive activity labels to the data frame, drawn from activity_labels.txt in the original data.

The end goal was to create a tidier data set, highlighting variable averages given subject and particular activity.

The final step creates a tidy data set with the average of each variable for each activity and each subject. 

##Project Repository
Full project repository found [here](https://github.com/kcsofiava/Getting-and-Cleaning-Data-Project)

