# NOTE: The following code assumes the data is located in the working directory

# Load feature and activity lists 
features <- read.table('./features.txt', col.names=c("index", "name"))
activities <- read.table('./activity_labels.txt', col.names = c("index", "name"))

# Load training labels, data, and subjects
train.labels <- read.table('./train/y_train.txt')
train.set <- read.table('./train/X_train.txt')
train.subjects <- read.table('./train/subject_train.txt') 

# Load test labels, data, and subjects
test.labels <- read.table('./test/y_test.txt')
test.set <- read.table('./test/X_test.txt')
test.subjects <- read.table('./test/subject_test.txt')

#combine training and test data
all.observations <- rbind(train.set, test.set)
labels <- rbind(train.labels, test.labels)
labels <- activity.labels[labels[,1],"name"]
subjects <- rbind(train.subjects, test.subjects)

#take standard deviation and mean features
mean_std.features <- features[grep("std\\(\\)$|mean\\(\\)$", features$name),]
#get observations for the std and mean features
all.mean_std <- all.observations[,mean_std.features$index]

# Turn names into character strings and remove the parenthesis
names(all.mean_std) <- gsub("\\(\\)", "", as.character(mean_std.features$name))

#bind subjects and labels to the observation data and name new columns
all.mean_std <- cbind(subjects, labels, all.mean_std)
colnames(all.mean_std)[c(1,2)] <- c("subject", "label")

# Walk through every activity label for each subject, building a new data set of subject/activity means
unique.subjects <- sort(unique(subjects)$V1)
unique.labels <- unique(labels)
tidy <- data.frame()

for (i in unique.subjects) {
    for (j in unique.labels) {
        subject_by_label <- all.mean_std[all.mean_std$subject == i & all.mean_std$label == j,]
        tidy <- rbind(tidy, data.frame(c(subject_by_label[1,c(1,2)], colMeans(subject_by_label[, -c(1,2)]))))
    }
}

#write out tidy dataset. Use the txt extension because of file submission requirements
write.csv(tidy, file="./tidydataset_project1.txt", row.names = FALSE)

