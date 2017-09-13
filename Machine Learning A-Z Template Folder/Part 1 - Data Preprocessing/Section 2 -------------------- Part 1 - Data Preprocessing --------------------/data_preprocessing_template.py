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
                
#training and test set
from sklearn.cross_validation import train_test_split 
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)

#FEATURE SCALING, because salary numbers dominate the age numbers
#sc = scale; scaling dummy variables depends on you 
'''from sklearn.preprocessing import StandardScaler 
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.fit_transform(X_test)
'''