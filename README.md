# OttoQuant API Code and Docs

This repository contains functions and documentation allowing users to easily access our predictive analytics APIs. This is currently limited to the beta version of our machine learning API.

## Quick Start

The OttoML API gives programmatic access to OttoQuant's in house machine learning tools. Software to access the API via R or Python is available here:

[R Code](https://github.com/SethOttoQuant/OttoQuantPublic/tree/master/R/OttoML)

[Python Code](https://github.com/SethOttoQuant/OttoQuantPublic/tree/master/Python/OttoML)

API Address: 142.93.85.22

Swagger Docs: [142.93.85.22/\_\_docs\_\_](http://142.93.85.22/__docs__/)

## Overview

OttoQuant's machine learning algorithm is designed to look for relationships or patterns in data that allow us to predict a target series using a set of predictors or right hand side (RHS) variables. We can state this relationship as

$p(x) = f(y_1, y_2, y_3, \ldots)$

where $p(x)$ represents the probability of observing some value of $x$ based on our observations $y_1, y_2, y_3, \ldots$. The function $f(\cdot)$ represents our machine learning algorithm. The basic API call returns three objects. \verb|x_point| is the expected value of $x$ defined as
\[ E(x) = \int x p(x) dx \]
The output \verb|x_dist| is the empirical distribution of $x$, representing the probability of each value in \verb|x_grid|.

Using these algorithms requires two fundamental objects: a set of \verb|training_data| used as a model, and one or more \verb|observations|, that is, right hand side variables used to predict our target variable. These data must meet certain criteria. First, \verb|training_data| must be a data frame like object with each series represented by a column and observations in rows. Moreover, our target series, the series we would like to predict, must be ordered first, that is, in the first column. The order of all other predictors, or RHS variables, does not matter so long as it is consistent with their order in \verb|observations|. This means that \verb|training_data| will have one more column than \verb|observations| Second, all data must be stationary. This means that the data scientist will have to take logs, seasonally adjust, take differences, or preform any other necessary data transformations prior to making an API call. Missing values are accepted in both \verb|training_data| and \verb|observations| as are mixed frequency data, as described below.

Further details and documentaion is located in [docs](https://github.com/SethOttoQuant/OttoQuantPublic/tree/master/docs)
