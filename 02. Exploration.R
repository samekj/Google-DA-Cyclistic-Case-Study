#=========================
# STEP 4: EXPLORE THE DATA
#=========================

str(all_trips)

# Count of duplicated data
sum(duplicated(all_trips))

# Count NA values per column
colSums(is.na(all_trips))

# Count the distinct values in the "rideable_type" column
table(all_trips$rideable_type)

# Count the distinct values in the "member_casual" column
table(all_trips$member_casual)