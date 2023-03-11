# NYUCapstone
Machine learning model predicting landing times at Dubai International Airport (DXB)

This is a series of R Markdown files which predict the number of minutes required for an incoming flight to traverse 120 nautical miles (nm) to the DXB landing strip. The library contains several models ranging from simple linear regressions to more complex ensemble models like XGBoost and Random Forests.  

Despite performing the prediction from 3 times further from the airport (current predictions were made from 40 nm), 78 percent of the best model's predictions were within 3 minutes, the airport's acceptable window, of the actual landing time. This level of accuracy is more than double the status quo. 

The data was cleaned through the imputation and/or removeal of outliers and inspected for quality using the skimr package. Additional steps were taken to avoid data leakage from the input variables. Leveraging the subject matter experts at the airpor, we chose which inputs would be the best predictors of landing time. Knowing we wanted to improve performance, we conducted feature engineering to create a congestion variable airport staff was not considering. 

The model was trained (70%) and tested (30%) on over 550,000 flights landing at Dubai International Airport between 2017-2021 containing a variety of factorial and numeric variables describing traffic and weather conditions, aircraft size, airline, flight origin, and date and time information. The data comes from the Electronic Flight Progress Strip, ground and airspace radar, Meteorological Aerodome Reports (METAR), and declared capacities of the airport data. 

Understanding the drivers of travel time was of paramount importance to enable to the staff to impact these times. Variable importance was shown through a Shapley Additive Explanations (SHAP). The creation and addition of this variable was shown to be primarily responsible for the model's performance.  
