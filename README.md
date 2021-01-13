# OttoQuant API Code and Docs

This repository contains functions and documentation allowing users to easily access our predictive analytics APIs. This is currently limited to the beta version of our machine learning API.

## Quick Start

The OttoML API gives programmatic access to OttoQuant's in house machine learning tools. Software to access the API via R or Python is available here:

[R Code](https://github.com/SethOttoQuant/OttoQuantPublic/tree/master/R/OttoML)

[Python Code](https://github.com/SethOttoQuant/OttoQuantPublic/tree/master/Python/OttoML)

API Address: 142.93.85.22

Swagger Docs: [142.93.85.22/\_\_docs\_\_](http://142.93.85.22/__docs__/)

## ML Overview

OttoQuant's machine learning algorithm is designed to look for relationships or patterns in data that allow us to predict a target series using a set of predictors or right hand side (RHS) variables. The output **x_point** gives the expected value of our target variable based on **observations** and **x_dist** is the empirical distribution of our target variable, representing the probability of each value in **x_grid**.

Using these algorithms requires two fundamental objects: a set of **training_data** used as a model, and one or more **observations**, that is, right hand side variables used to predict our target variable. These data must meet certain criteria. First, **training_data** must be a data frame like object with each series represented by a column and observations in rows. Moreover, our target series, the series we would like to predict, must be ordered first, that is, in the first column. The order of all other predictors, or RHS variables, does not matter so long as it is consistent with their order in **observations**. This means that **training_data** will have one more column than **observations**. Second, all data must be stationary. This means that the data scientist will have to take logs, seasonally adjust, take differences, or preform any other necessary data transformations prior to making an API call. Missing values are accepted in both **training_data** and **observations** as are mixed frequency data, as described in the docs.

Further details and documentation is located in [docs](https://github.com/SethOttoQuant/OttoQuantPublic/tree/master/docs)
