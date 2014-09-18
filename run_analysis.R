library(plyr)

#Merge the training and the test sets to create one data set.

features<-read.table('features.txt')
names(features)<-c('id','name')

#Load the data sets and merge.
X_train<-read.table('train/X_train.txt', comment.char="")
y_train<-read.table('train/y_train.txt', comment.char="")
subject_train<-read.table('train/subject_train.txt', comment.char="")
X_test<-read.table('test/X_test.txt', comment.char="")
y_test<-read.table('test/y_test.txt', comment.char="")
subject_test<-read.table('test/subject_test.txt', comment.char="")
activity_labels<-read.table('activity_labels.txt')

activities<-rbind(y_train,y_test)
names(activities)<-'activity_id'
subjects<-rbind(subject_train,subject_test)
names(subjects)<-'subject'
X_set<-rbind(X_train,X_test)
names(X_set)<-features[,2]
result<-cbind(X_set,subjects,activities)

#Extract the measurements for the mean and standard deviation for each measurement.
#Include mean frequency as well as mean.
ids<-names(result)[grepl('mean|std|subject|activity_id',names(result))]
result<-result[ids]

#Join the activity labels into the set for descriptive activity names.
names(activity_labels)<-c('id','activity')
result<-merge(result,activity_labels,by.x='activity_id',by.y='id')

#Calculate the mean for each measurement, grouped by activity and subject.
result<-ddply(result,.(activity_id,activity,subject),numcolwise(mean))

obs<-dim(result)[2]
names(result)[4:obs]<-paste('meanOf_',names(result)[4:obs],sep='')

write.table(result,'tidy_data_set.txt',row.name=FALSE)

#Remove the data sets we no longer need from memory.
rm(subject_test)
rm(subject_train)
rm(X_test)
rm(X_train)
rm(y_test)
rm(y_train)
rm(X_set)
rm(activities)
rm(subjects)
rm(features)
rm(activity_labels)