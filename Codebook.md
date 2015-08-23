##Code Book
This document describes my **run_analysis.R** code.

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


These variables are files that contain measurements from the Samsung Galaxy S accelerometer and gyroscope, as well as the activity label and subject identifiers.

##Project Repository
Full project repository found [here](https://github.com/kcsofiava/Getting-and-Cleaning-Data-Project)

