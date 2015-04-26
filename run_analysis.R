## Course 3 Project: Getting and Cleaning Data

## 1. Merges the training and the test sets to create one data set.

#binding the X sets for both training and test.
xtp1 <- read.table("train/X_train.txt")
xtp2 <- read.table("test/X_test.txt")
X <- rbind(xtp1, xtp2)

#binding the Subject sets for both training and test.
stp1 <- read.table("train/subject_train.txt")
stp2 <- read.table("test/subject_test.txt")
S <- rbind(stp1, stp2)

#binding the Y sets for both training and test.
ytp1 <- read.table("train/y_train.txt")
ytp2 <- read.table("test/y_test.txt")
Y <- rbind(ytp1, ytp2)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")
ifeatures <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, ifeatures]
names(X) <- features[ifeatures, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

## 3. Uses descriptive activity names to name the activities in the data set.

activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

## 4. Appropriately labels the data set with descriptive activity names.

names(S) <- "subject"
cleaned <- cbind(S, Y, X)

## 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

uSubjects = unique(S)[,1]
nSubjects = length(unique(S)[,1])
nActivities = length(activities[,1])
nCols = dim(cleaned)[2]
result = cleaned[1:(nSubjects*nActivities), ]

row = 1
for (s in 1:nSubjects) {
    for (a in 1:nActivities) {
        result[row, 1] = uSubjects[s]
        result[row, 2] = activities[a, 2]
        tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities[a, 2], ]
        result[row, 3:nCols] <- colMeans(tmp[, 3:nCols])
        row = row+1
    }
}
# Outputs the results into a file.
write.table(result, "tidy_data_with_average.txt", row.names=FALSE)