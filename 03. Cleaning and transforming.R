#======================================================
# STEP 4: CLEAN UP AND ADD DATA TO PREPARE FOR ANALYSIS
#======================================================

# Creating a new dataset only with the location info
all_trips_geo <- subset(all_trips, select = -c(ride_id,rideable_type, started_at, ended_at) )

# Count NA values per column
colSums(is.na(all_trips_geo))

# Remove rows containing NA values from the all_trips_geo dataframe
all_trips_geo <- na.omit(all_trips_geo)

# Format and pad latitude and longitude columns to 6 decimal places and 9 characters.
all_trips_geo <- all_trips_geo %>%
  mutate(
    start_lat = str_pad(format(start_lat, nsmall = 6), width = 9, side = "right", pad = "0"),
    start_lng = str_pad(format(start_lng, nsmall = 6), width = 9, side = "right", pad = "0"),
    end_lat = str_pad(format(end_lat, nsmall = 6), width = 9, side = "right", pad = "0"),
    end_lng = str_pad(format(end_lng, nsmall = 6), width = 9, side = "right", pad = "0")
  )

# Define the Mode function
Mode <- function(x) {
  uniq_x <- unique(x)
  uniq_x[which.max(tabulate(match(x, uniq_x)))]
}

# Group by start_station_name and calculate the most common lat/lng
start_location <- all_trips_geo %>%
  group_by(start_station_name, member_casual) %>%
  summarize(
    start_latitude = Mode(start_lat),
    start_longitude = Mode(start_lng),
    total_trips = n()
  ) %>%
  ungroup() %>%
  arrange(desc(total_trips))

# Group by end_station_name and calculate the most common lat/lng
end_location <- all_trips_geo %>%
  group_by(end_station_name, member_casual) %>%
  summarize(
    end_latitude = Mode(end_lat),
    end_longitude = Mode(end_lng),
    total_trips = n()
  ) %>%
  ungroup() %>%
  arrange(desc(total_trips))

# Renaming columns
all_trips_geo <- all_trips_geo %>%
  rename(
    start_latitude = start_lat,
    start_longitude = start_lng,
    end_latitude = end_lat,
    end_longitude = end_lng
  )

str(all_trips_geo)

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

# The new dataset 'all_trips_v3' will contain filtered data: non-negative values, non-NA values, filtering rides longer than a day, and only columns we're interested in

# Create a new data frame without negative values in column ride_duration_sec
all_trips_v3 <- all_trips_v2[all_trips_v2$ride_duration_sec >= 0,]

# Count NA values per column
colSums(is.na(all_trips_v3))

# Verifying the count of negative values in column x
sum(all_trips_v3$ride_duration_sec < 0, na.rm = TRUE)

# Creating a new dataset without columns we're not interested in: start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng
all_trips_v3 <- subset(all_trips_v3, select = -c(start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng) )

# Filter rides with a duration of more than one day (86400 seconds)
all_trips_v3 <- all_trips_v3[all_trips_v3$ride_duration_sec <= 86400,]

# Verifying the count of rows with a ride duration of more than a day
sum(all_trips_v3$ride_duration_sec > 86400)

# Extracting the started hour
all_trips_v3$started_hour <- hour(all_trips_v3$started_at)

# Extracting the weekday (Sunday = 1, Saturday = 7)
all_trips_v3$day_of_week <- weekdays(all_trips_v3$started_at)

# Extracting month and creating a new column
all_trips_v3$month <- format(all_trips_v3$started_at, "%B")

# Checking the structure of the tables
str(all_trips_v3)
str(start_location)
str(end_location)

# Exporting dataframes to a CSV file for further analysis and visualization
write.csv(all_trips_v3, file = '~/Documents/GOOGLE DATA ANALYTICS/bike case/all_trips_v3.csv')
write.csv(start_location, file = '~/Documents/GOOGLE DATA ANALYTICS/bike case/start_location.csv')
write.csv(end_location, file = '~/Documents/GOOGLE DATA ANALYTICS/bike case/end_location.csv')
