#======================================================
# STEP 4: CLEAN UP AND ADD DATA TO PREPARE FOR ANALYSIS
#======================================================

# The new dataset 'all_trips_v2' will contain tranformations of the data, so the original 'all_trips' remain as a backup

# Create a new dataset ordered by started_at time
all_trips_v2 <- all_trips[order(all_trips$started_at), ]

# Calculate the ride duration in seconds in a new column
all_trips_v2$ride_duration_sec <- all_trips_v2$ended_at - all_trips_v2$started_at

# Convert the ride_duration_sec to numeric in seconds
all_trips_v2$ride_duration_sec<- as.numeric(all_trips_v2$ride_duration_sec, units = "secs")

# Convert ride_duration_sec to minutes in ride_duration_min
all_trips_v2$ride_duration_min <- round(all_trips_v2$ride_duration_sec/60,0)

# Convert ride duration from seconds to HH:MM:SS format (as chr)
all_trips_v2$ride_duration_hms <- sprintf("%02d:%02d:%02d",
                                       as.numeric(all_trips_v2$ride_duration_sec) %/% 3600,
                                       (as.numeric(all_trips_v2$ride_duration_sec) %/% 60) %% 60,
                                       as.numeric(all_trips_v2$ride_duration_sec) %% 60)

# Convert ride duration from seconds to HH:MM:SS format (as 'hms' num)
#all_trips_v2$ride_duration_hms <- round_hms(as_hms(all_trips_v2$ride_duration_sec), digits = 0)

# Count the rows with a ride duration of more than a day
sum(all_trips_v2$ride_duration_sec > 86400)

# Count the number of negative values of column ride_duration_sec
sum(all_trips_v2$ride_duration_sec < 0, na.rm = TRUE)

# Count NA values per column
colSums(is.na(all_trips_v2))

# The new dataset 'all_trips_v3' will contain filtered data: non-negative values, non-NA values and only columns we're interested in

# Create a new data frame without negative values in column ride_duration_sec
all_trips_v3 <- all_trips_v2[all_trips_v2$ride_duration_sec >= 0,]

# Count NA values per column
colSums(is.na(all_trips_v3))

# Verifying the count the number of negative values in column x
sum(all_trips_v3$ride_duration_sec < 0, na.rm = TRUE)

# Creating a new dataset without columns we're not interested in: start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng
all_trips_v3 <- subset(all_trips_v3, select = -c(start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng) )

# Extracting the started hour
all_trips_v3$started_hour <- hour(all_trips_v3$started_at)

# Extracting the weekday (Sunday = 1, Saturday = 7)
all_trips_v3$day_of_week <- weekdays(all_trips_v3$started_at)

# Extracting month and creating a new column
all_trips_v3$month <- format(all_trips_v3$started_at, "%B")

str(all_trips_v3)