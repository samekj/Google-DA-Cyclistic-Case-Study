#=====================================
# STEP 5: CONDUCT DESCRIPTIVE ANALYSIS
#=====================================

# Analyzing the ride_duration_min column 
summary(all_trips_v3$ride_duration_min)

# Ordering by days
order_of_days <- c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")

# Ordering by months
order_of_months <- c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")

# Analyze ridership data by User type and Day of week
day_of_ride <- all_trips_v3 %>% 
  mutate(day_of_week = factor(day_of_week, levels = order_of_days)) %>%
  group_by(member_casual, day_of_week) %>%  #groups by usertype and day of week
  summarise(number_of_rides = n()							#calculates the number of rides and average duration 
            ,avg_duration_minutes = round(mean(ride_duration_min),0)) %>% 		# calculates the average duration
  arrange(member_casual, day_of_week)

# Analyze ridership data by User type and Started Hour
hour_of_ride <- all_trips_v3 %>% 
  group_by(member_casual, started_hour) %>%  #groups by usertype and day of week
  summarise(number_of_rides = n()							#calculates the number of rides and average duration 
            ,avg_duration_minutes = round(mean(ride_duration_min),0)) %>% 		# calculates the average duration
  arrange(member_casual, started_hour)

# Analyze ridership data by User type and Month of ride
month_of_ride <- all_trips_v3 %>% 
  mutate(month = factor(month, levels = order_of_months)) %>%
  group_by(member_casual, month) %>%  #groups by usertype and day of week
  summarise(number_of_rides = n()							#calculates the number of rides and average duration 
            ,avg_duration_minutes = round(mean(ride_duration_min),0)) %>% 		# calculates the average duration
  arrange(member_casual, month)

# Analyze ridership data by User type and Bicycle type
all_trips_v3 %>% 
  group_by(member_casual, rideable_type) %>%  #groups by usertype and rideable type
  summarise(number_of_rides = n()							#calculates the number of rides and average duration 
            ,avg_duration_min = round(mean(ride_duration_min),0)) %>% 		# calculates the average duration
  arrange(member_casual, rideable_type)



