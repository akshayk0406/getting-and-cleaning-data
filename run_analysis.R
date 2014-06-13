#Project for getting and cleaning data

#Step:-1 Extracting and merging dataSets

Xtest <- read.table("test/X_test.txt")
Ytest <- read.table("test/y_test.txt")
Stest <- read.table("test/subject_test.txt")

Xtrain <- read.table("train/X_train.txt")
Ytrain <- read.table("train/y_train.txt")
Strain <- read.table("train/subject_train.txt")

X <- rbind(Xtrain,Xtest)
Y <- rbind(Ytrain,Ytest)
S <- rbind(Strain,Stest)

#Step:-2 Extracts only the measurements on the mean and standard deviation for each measurement. 
features      <- read.table("features.txt")
required_idx  <- grep("-mean\\(\\)|-std\\(\\)",features[,2])
X             <- X[,required_idx]
names(X)      <- features[required_idx,2]
names(X)      <- gsub("\\(|\\)","",names(X))
names(X)      <- tolower(names(X))
names(X)      <- gsub("-","",names(X))


#Step3:- Uses descriptive activity names to name the activities in the data set
activity_label     <- read.table("activity_labels.txt")
activity_label[,2] <- tolower(gsub("_","",activity_label[,2]))
Y[,1]              <- activity_label[Y[,],2]
names(Y)           <- "activity"

#Step4:- Appropriately labels the data set with descriptive variable names
names(S)      <- "subject"
final_data    <- cbind(S,Y,X)  
write.table(final_data,"final_data.txt")

#Step5:- Creates a second, independent tidy data set with the average of each variable for each activity and each subject
subjects      <- unique(S)[,1]
total_subjects<- length(unique(S)[,1])
cols          <- dim(final_data)[2]
total_activity<- length(activity_label[,1]) 
result           <- final_data[1:(total_subjects*total_activity),]
row          <- 1

for(i in 1:total_subjects)
{
  for(j in 1:total_activity)
  {
    result[row, 1]      <- subjects[i]
    result[row, 2]      <- activity_label[j, 2]
    result[row, 3:cols] <- colMeans(final_data[i == final_data$subject&activity_label[j, 2] == final_data$activity, 3:cols])
    row <- row + 1
  }
}

write.table(result,"new_final_data.txt")
