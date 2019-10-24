# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('50_Startups.csv')

dataset$State = factor(dataset$State,
                         levels = c('New York', 'California', 'Florida'),
                         labels = c(1, 2, 3))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


#regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)
#same as
regressor = lm(formula = Profit ~ ., data = training_set)

#Prediction
y_pred = predict(regressor, newdata = test_set)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)