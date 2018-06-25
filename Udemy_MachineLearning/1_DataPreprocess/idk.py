# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
#import libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#importing dataset, independent and dependent variables x, y
dataset = pd.read_csv('Data.csv')
X = dataset.iloc[:, :-1].values #all rows, all columns except last one, independent
y = dataset.iloc[:, 3].values
                
#taking care of missing data
''' fyi
from sklearn.preprocessing import Imputer
imputer = Imputer(missing_values = 'NaN', strategy = 'mean', axis = 0)
imputer = imputer.fit(X[:, 1:3]) #upper bound excluded
X[:, 1:3] = imputer.transform(X[:, 1:3])
'''

#encoding categorical data
'''fyi
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
labelencoder_x = LabelEncoder()
X[:, 0] = labelencoder_x.fit_transform(X[:, 0]) 
onehotencoder = OneHotEncoder(categorical_features = [0]) #[0] just the countries column
X = onehotencoder.fit_transform(X).toarray()
#y is one column 
labelencoder_y = LabelEncoder()
y = labelencoder_y.fit_transform(y) 
'''
#training and test set
# test size = 20% of the data to test, pick 2 observations for test and 8 for train 
# don't need to input train size, cuz 1-0.2 is obvious, random state can be any number
# picked 0 to match the instructor
# using training set to learn, then test set to apply what machine has learned
from sklearn.cross_validation import train_test_split 
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)

#FEATURE SCALING, because salary numbers dominate the age numbers
#sc = scale; scaling dummy variables depends on you 
from sklearn.preprocessing import StandardScaler 
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.fit_transform(X_test)