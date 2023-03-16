# NYUCapstone
Machine learning model predicting landing times at Dubai International Airport (DXB)

![A2WNmpowcM](https://user-images.githubusercontent.com/73828790/225470724-adb7279b-ccf6-463d-89c4-8d44b84d790d.png)

### Overview

This goal of this project was to develop a model that accurately predicts arrival time 120 nautical miles (nm) from the runway at DXB, a distance it takes approximately 30 minutes to traverse.  It was my capstone project to complete by masters of business analytics degress from NYU Stern.  

### Data Collection 

Data was taken from 4 different sources:
1. DXB airport,
2. Radar,
3. Electronic Flight Progress Strip,and 
4. Meteorological Aerodome Reports (METAR). 

The data provided a variety of factorial and numeric variables describing traffic and weather conditions, aircraft size, airline, flight origin, and date and time information for 550,000 flights landing at DXB between 2017-2021. 

### Data Cleaning 

The data was cleaned through the imputation and/or removeal of outliers and inspected for quality using the skimr package. Additional steps were taken to avoid data leakage from the input variables by deleting information that could not have been known at the 120 nm from the runway.

### Feature Engineering
Leveraging the subject matter experts at the airport, we chose which inputs would be the best predictors of landing time. In addition, we sought to improve performance by creating a congestion variable airport staff was not considering. 

### Model Creation and Training 
A series of models were created to predict flight time ranging from simple linear regressions to more complex models such as Random Forests and XGBoost. The models were trained using with 70 percent of our data, while the remainder was reserved for testing and validation. The number of folds for cross-valdation, the depth of trees were the hyperparameters tuned via grid search. 

### Model Performance 
Despite performing the prediction from 3 times further from the airport (current predictions were made from 40 nm), 78 percent of the best model's predictions were within 3 minutes, the airport's acceptable window, of the actual landing time. This level of accuracy is more than double the status quo. 

![0HGYO3hghG](https://user-images.githubusercontent.com/73828790/225478311-548b5487-f94b-4835-b60d-6dddb82872da.png)

### Variable Importance

Understanding the drivers of travel time was of paramount importance to enable to the staff to impact these times. Variable importance was shown through a Shapley Additive Explanations (SHAP). The creation and addition of the congestion variable was shown to be primarily responsible for the model's improved performance.  

![R7KGiTYoWw](https://user-images.githubusercontent.com/73828790/225478775-d9f390bf-d552-412f-9591-3596f4a249a7.png)

### Collaborators
This project was done in collaboration with Saima Ali, Erin Mackin, and Caroline Rolfe. 

