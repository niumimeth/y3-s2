###############################
# ADDITIONAL LAB 02 – FULL CODE
###############################

# 1️⃣ Enter the Dataset

Team <- c("Atlanta Braves","New York Mets","Philadelphia Phillies","Florida Marlins",
          "Houston Astros","Chicago Cubs","St. Louis Cardinals","Cincinnati Reds",
          "Milwaukee Brewers","Pittsburgh Pirates","San Diego Padres",
          "San Francisco Giants","Colorado Rockies","Arizona Diamondbacks",
          "New York Yankees","Boston Red Sox","Toronto Blue Jays",
          "Baltimore Orioles","Tampa Bay Devil","Cleveland Indians",
          "Chicago White Sox","Kansas City Royals","Minnesota Twins",
          "Detroit Tigers","Texas Rangers","Anaheim Angels",
          "Seattle Mariners","Oakland Athletics","Montreal Expos",
          "Los Angeles Dodgers")

X1 <- c(3.361,2.288,1.716,0.914,1.750,2.450,2.623,3.195,1.794,1.812,
        1.561,2.556,1.926,3.089,3.789,3.603,2.950,2.344,2.454,3.685,
        2.506,3.467,1.391,1.495,1.166,1.409,2.927,2.519,2.644,1.232)

X2 <- c(59.536,49.518,34.370,9.162,33.434,40.629,49.433,52.575,
        21.995,32.393,13.352,45.368,40.571,47.970,47.435,30.572,
        63.461,51.647,48.666,68.988,25.318,59.584,36.840,32.963,
        26.183,22.725,55.305,38.702,52.027,20.063)

X3 <- c(3,35,28,23,12,34,85,33,29,46,29,32,39,37,4,1,76,87,10,7,
        9,5,8,26,17,87,5,33,23,33)

data <- data.frame(Team, Team_Attendance=X1, Team_Salary=X2, Years=X3)


variables <- list(X1, X2, X3)
names <- c("Team Attendance","Team Salary","Years")

for(i in 1:3){
  
  cat("\n")
  cat("Variable:", names[i], "\n")
  cat("\n")
  
  # Histogram
  hist(variables[[i]], main=paste("Histogram of", names[i]),
       col="lightblue", xlab=names[i])
  
  # Boxplot
  boxplot(variables[[i]], main=paste("Boxplot of", names[i]),
          col="orange")
  
  # Stem & Leaf
  cat("\nStem-and-Leaf Plot:\n")
  stem(variables[[i]])
  
  # Mean, Median, SD
  cat("\nMean:", mean(variables[[i]]))
  cat("\nMedian:", median(variables[[i]]))
  cat("\nStandard Deviation:", sd(variables[[i]]))
  
  # Quartiles
  cat("\nFirst Quartile (Q1):", quantile(variables[[i]],0.25))
  cat("\nThird Quartile (Q3):", quantile(variables[[i]],0.75))
  
  # IQR
  cat("\nInterquartile Range (IQR):", IQR(variables[[i]]))
  
  cat("\n\n")
}

mode_function <- function(x){
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

cat("\nMode of Years:", mode_function(X3), "\n")


outlier_function <- function(x){
  Q1 <- quantile(x,0.25)
  Q3 <- quantile(x,0.75)
  IQR_value <- IQR(x)
  
  lower <- Q1 - 1.5*IQR_value
  upper <- Q3 + 1.5*IQR_value
  
  x[x < lower | x > upper]
}

cat("\nOutliers in Team Attendance:\n")
print(outlier_function(X1))

cat("\nOutliers in Team Salary:\n")
print(outlier_function(X2))

cat("\nOutliers in Years:\n")
print(outlier_function(X3))