#importing dataset
dataset = read.csv('Data.csv')

#taking care of missing data
# if data set column age has a missing value, first parameter is replace with average
# second is to replace with 
dataset$Age = ifelse(is.na(dataset$Age),# if this condition is true 
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)), dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary),# if this condition is true 
                     ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)), dataset$Salary)

#encoding categorical data F1 TO VIEW FUNCTIONS
# data to transform to vectors, levels, labels (choose which numbers to give to these countries)
dataset$Country = factor(dataset$Country, levels = c('France', 'Spain', 'Germany'), labels = c(1,2,3))

dataset$Purchased = factor(dataset$Purchased, levels = c('Yes', 'No'), labels = c(1,0))

#splitting data set into training and test set
#side note here is how to install a package very easy
#install.packages('caTools')
#library(caTools) to select the library
set.seed(123)
#training set 0.8
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
#> split
#[1]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE
# true = training set false = test set 
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#feature scaling
#factors are not numeric numbers (countries and purchased were changed into factors not numeric)
#so we just pick specific columns to scale 
#all rows, columns 2 and 3 Age and Salary
training_set[, 2:3] = scale(training_set[, 2:3])
test_set[, 2:3] = scale(test_set[, 2:3])


