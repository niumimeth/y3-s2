setwd("C:/Users/niumi/Downloads")
getwd()
# Import dataset (change file path if needed)
data <- read.csv("Sample Data.csv", header = TRUE)

# View first few rows
head(data)

# Check structure
str(data)

# Rename columns if necessary
colnames(data) <- c("Age", "Gender", "Accommodation")

# Convert Gender and Accommodation to factors with labels
data$Gender <- factor(data$Gender,
                      levels = c(1,2),
                      labels = c("Male","Female"))

data$Accommodation <- factor(data$Accommodation,
                             levels = c(1,2,3),
                             labels = c("Home","Boarded","Lodging"))

# Check structure again
str(data)
 
summary(data$Age)        # Mean, median, min, max
sd(data$Age)             # Standard deviation

hist(data$Age,
     main="Histogram of Age",
     xlab="Age",
     col="lightblue")

boxplot(data$Age,
        main="Boxplot of Age",
        col="orange")

table(data$Gender)       # Frequency
prop.table(table(data$Gender))  # Proportions

barplot(table(data$Gender),
        main="Gender Distribution",
        col=c("skyblue","pink"))

table(data$Accommodation)
prop.table(table(data$Accommodation))

barplot(table(data$Accommodation),
        main="Accommodation Distribution",
        col=c("green","yellow","purple"))

# Cross-tabulation
table(data$Gender, data$Accommodation)

# Proportion table
prop.table(table(data$Gender, data$Accommodation))

# Clustered barplot
barplot(table(data$Gender, data$Accommodation),
        beside=TRUE,
        col=c("blue","red"),
        legend=TRUE,
        main="Gender vs Accommodation")

tapply(data$Age, data$Gender, summary)

boxplot(Age ~ Gender,
        data=data,
        main="Age by Gender",
        col=c("skyblue","pink"))

tapply(data$Age, data$Accommodation, summary)

boxplot(Age ~ Accommodation,
        data=data,
        main="Age by Accommodation",
        col=c("green","yellow","purple"))
# Using aggregate
aggregate(Age ~ Gender + Accommodation,
          data = data,
          FUN = mean)

# Using tapply (Matrix Format)
tapply(data$Age,
       list(data$Gender, data$Accommodation),
       mean)

result <- tapply(data$Age,
                 list(Gender = data$Gender,
                      Accommodation = data$Accommodation),
                 mean)

print(result)