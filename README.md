# NYUCapstone
Machine learning model predicting landing times at Dubai International Airport

This is a series of R Markdown files which predicts the number of minutes it takes an incoming flight to traverse 120 nautical miles (nm) to the landing strip. The library contains several models ranging from simple linear regressions to more complex ensemble models like XGBoost and Random Forests.  

Despite performing the prediction from 3 times further from the airport (current predictions were made from 40 nm), 78 percent of the best model's predictions were within 3 minutes, the airport's acceptable window, of the actual landing time.  

The model was trained (70%) and tested (30%) on over 550,000 flights landing at Dubai International Airport between 2017-2021containing a variety of factorial and numeric variables describing traffic and weather conditions, aircraft size, airline, flight origin, and date and time information.  The data comes from the Electronic Flight Progress Strip, ground and airspace radar, Meteorological Aerodome Reports (METAR), and declared capacities of the airport data. 
