setwd("~/R/GACDP/Dataset")
library(data.table) ## for more efficient management of data frames
library(plyr) ## manipulates data frames good
library(dplyr) ## manipulates data frames better

##Load data items into global environment
trX = read.csv("train/X_train.txt", sep="", header=FALSE)
trY = read.csv("train/Y_train.txt", sep="", header=FALSE)
subtrain = read.csv("train/subject_train.txt", sep="", header = FALSE)
teX = read.csv("test/X_test.txt", sep = "", header=FALSE)
teY = read.csv("test/Y_test.txt", sep = "", header=FALSE)
subtest = read.csv("test/subject_test.txt", sep="", header = FALSE)
actlabels = read.csv("activity_labels.txt", sep="", header=FALSE)
feats = read.csv("features.txt", sep="", header=FALSE)

##make some of the feature names a bit more easy to read
feats[,2] = gsub('-std', 'std', features[,2])
feats[,2] = gsub('-mean', 'mean', features[,2])
feats[,2] = gsub('[-()]', '', features[,2])
feats[,2] <- gsub("\\()", "", features[,2])

actlabels <- actlabels$V2
actlabels <- tolower(actlabels)
actlabels <- sub("_", " ", actlabels)

##and assign the descriptive features labels onto the appropriate columns
names(teX) <- feats; names(trX) <- feats
names(teY) <- "activity"; names(trY) <- "activity"
names(subtest) <- "participant"; names(subtrain) <- "participant"

##glance at the properties of the loaded data variables
str(actlabels)
str(teX)
str(teY)
str(subtest)
str(trX)
str(trY)

##Merge the training and test data sets!
mergeddata <- rbind(trX, teX)

##Select only the mean or standard deviation data
meanORstd <- grep(".*mean.*|.*std.*", names(mergeddata))

##Add subject and activity
meanORstd <- c(meanORstd, 562, 563)
Data <- mergeddata[,meanORstd]

##Improve labeling
colnames(Data) <- c(feats$V2, "Activity", "Subject")
colnames(Data) <- tolower(colnames(Data))
cactive = 1 
for (currentActivityLabel in actlabels$V2) {
    Data$activity <- gsub(cactive, currentActivityLabel, Data$activity)
    cactive <- cactive + 1
}
Data$activity <- as.factor(Data$activity)
Data$subject <- as.factor(Data$subject)

tidy = aggregate(Data, by=list(activity = Data$activity, subject=Data$subject), mean)
tidy[,90] = NULL
tidy[,89] = NULL
write.table(tidy, file = "tidy.txt", sep="\t", row.names = FALSE)
