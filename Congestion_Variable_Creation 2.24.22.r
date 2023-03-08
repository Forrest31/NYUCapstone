library(readr)
flights_orig<- read_excel("DataDump_Full_v5 (1).xlsx")
flights <- flights_orig[c("mins_flight120nmtoaldt","Airline_Categorisation","At120NM_Event","At120NM_Time",
                          "DC_120NMTime","eWTS_Trial_Live","Peak_Hours_120NMTime",
                          "rwy_config_at120NM","vis_cond_at120nm_mapped",
                          "Hour_120NM_Time","Wake_Vortex_Category","RECAT_Category",
                          "Nature", "Category", "Engine_Type_Group","Congestion_Wake_Super",
                          "Congestion_Wake_Heavy","Congestion_Wake_Medium","Congestion_Wake_Light",
                          "Congestion_Wake_Other","Congestion_Overall","ALDT")]


#Business intelligence says that the fastest a plane can travel 120nm is 5 mins. 
#remove all observations whose 120 mins flight is less than 5
#we will never be able to train a model for extreme outliers so remove those as well
flights_orig<-flights_orig[!(flights_orig$mins_flight120nmtoaldt <5), ]
flights_orig<-flights_orig[!(flights_orig$mins_flight120nmtoaldt >=60), ]
flights<-flights[!(flights$mins_flight120nmtoaldt >=60), ]
flights<-flights[!(flights$mins_flight120nmtoaldt < 5), ]

# Real Time Congestion Trend
# When plane crosses 120 nm threshold, compare congestion at this moment to congestion 30 minutes ago (can change). Include 2 ways to look at this - value based and high level trend based (trending up, down, stagnant)
# count of planes in the air at time when plane crosses 120nm (existing variable Overall Congestion)
# count of planes 30 minutes ago - all planes that crossed 120 nm earlier than 20 min ago but have actual landing times later than 30 minutes ago
# earlier time to be considered, set interval - this can be modified

interval_in_minutes = 30 #this is the variable to change
earlier_interval = 60*interval_in_minutes #converts minutes to seconds for posix use

# Set up reference field for 30 minutes prior to plane crosses 120nm
flights$earlier_congestion_time = flights$At120NM_Time-earlier_interval
flights$count_flag = 1  #for easy summing

flights$earlier_congestion = sapply(seq_len(nrow(flights)), function(i) with(flights, sum(flights$count_flag[flights$At120NM_Time <= flights$earlier_congestion_time[i] & flights$ALDT >= flights$earlier_congestion_time[i]])))
# congestion trending from the 30 minutes prior - value and overall trend calc
flights$congestion_trend_value = flights$Congestion_Overall - flights$earlier_congestion
flights$congestion_trend_directional = ifelse(flights$congestion_trend_value > 0, "Trending Up", ifelse(flights$congestion_trend_value == 0, "Stagnant", "Trending Down"))
flights$congestion_trend_directional<-as.factor(flights$congestion_trend_directional)