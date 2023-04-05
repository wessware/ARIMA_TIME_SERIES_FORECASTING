# TIME SERIES ANALYSIS & FORECASTING

## Subject

This project is a case study of the deployment, management, and income generation from the Case iH JX75T, KTCC **8D, farm machinery from October 2021 to July 2022. 

![IMG_20210924_094144](https://user-images.githubusercontent.com/46624127/216979248-d15aa37b-845c-467b-b69b-45a9c96b249d.jpg)



## Definition

Time Series Analysis is a descriptive modeling technique in which a time series is modeled to determine its components in terms of seasonal patterns, trends, relation to 
external actors, and so on. 

Time Series Forecasting is an AI and mathematical technique that makes use of the best-fitting model essentials to predicting future observations based on the complex 
processing of current and previous data. Predictions are made for new data when the actual outcome may not be known until some future date. The future is being predicted, 
but all prior observations are almost always treated equally. Time Series forecasting uses the information in a time series to forecast future values of that series.

## Problem Statement

Farm machineries are an integral part of small scale & large scale farming in Kenya. Farmers rely on these machineries for different conveniences such as ploughing, harrowing, planting, transportation, and so on. For owners of these machineries, however, their management for optimal income and Return on Investment (ROI) can prove 
to be very challenging. This can be attributed to an array of factors that affect the demand for/of farm machineries at different times of the year.
This project deploys Time Series Analysis & Forecasting methods to understand (analyze) income generation from a select farm machinery owner for a period of ~10 months. 
The analysis (and forecasting) is based on the machine's usage for transport services & ploughing - analyzed on daily, monthly, yearly, and date-wise usage. 

## Intention 

From the Time Series Analysis, the project intends to create a hypothetical understanding on machinery demands at different times of the years, the type of machinery 
deployments to anticipate at different times of the years, and the (average) income generated from different machinery deployments (at different times of the year).

From the Time Series Forecasting, the project intends to provide the owner with daily, weekly, monthly, and date-wise projections of expected income to be generated
from the farm machineries. 
It is the hypothetical intention of this project that the insights gained herein, will help farm machinery owner's to properly plan the usage, and management of their 
farm machinery to ensure ROI, longevity, optimal income generation. 

## Key Models

<ol>
  
 ### A. Statistical
    
  <li>Auto-Regressive Integrated Moving Average - ARIMA</li/>
  <li>Auto-Auto-Regressive Integrated Moving Average - AUTO-ARIMA</li/>
  
 ### B. Machine Learning
  
  <li>LInear Regression - LR</li/>
  <li>Random Forest Regressor - RF</li/>
  <li>Extreme Gradient Boosting Regressor - XGB</li/>
  <li> Light Gradient Boosting Machine Regressor - LGBM </li/>
  <li> Categorical Boosting Regressor - CatBoost </li/>
  
  ### C. Deep Learning
  
  <li>Long Short Term Memory - LSTM</li>
  <li> Bidirectional Long Short Term Memory - BiLSTM </li/>
  <li> Gated Reccurent Unit - GRU </li/>
  
</ol/>

## Model Scores - Root Mean Squared Error 

<ol>
  <li>ARIMA       ==    3187.56</li/>
  <li>AUTO-ARIMA  ==    3197.61</li/>
  <li>LGBM        ==    3456.87</li/>
  <li>RF          ==    3592.49</li/>
  <li>BiLSTM      ==    3645.53</li/>
  <li>CatBoost    ==    3709.08</li/>
  <li>XGB         ==    3928.97</li/>
  <li>LSTM        ==    3939.83</li/>
  <li>LR          ==    4068.75</li/>
  <li>GRU         ==    4858.5181</li/>
</ol/>

## Output Visualizations 
### ARIMA
![download (1)](https://user-images.githubusercontent.com/46624127/229986778-4ea45845-f171-4417-8f81-06d5a4e50b70.png)

## Related
<a href src='https://github.com/wessware/ARIMA_TIME_SERIES_FORECASTING' target='_blank'>Arima Time Series Analysis & Forecasting </a>

## Publication

