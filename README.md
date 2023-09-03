---
title: "Bike Share"
author: "Samekj Jurado"
date: "2023-08-20"
output: github_document
---

# Google Data Analytics Capstone: Cyclistic Case Study

Course: [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)

Data source: [divvy-tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) (accessed on 08/20/23)

## Project Overview

### Scenario

I'm assuming to be a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company's future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve your recommendations, so they must be backed up with compelling data insights and professional data visualizations.

### Cyclistic

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.

Until now, Cyclistic's marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

Cyclistic's finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.

Lily Moreno, the director of marketing and my manager, has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, hoIver, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.

## Ask

### Business Task

The primary business task is to:

- Analyze Cyclistic's historical bike trip data to understand the differences in usage patterns betIen annual members and casual riders.
- Identify the motivations and factors that lead casual riders to purchase Cyclistic annual memberships.
- Develop effective digital media strategies that can influence casual riders to transition into becoming annual members.

### Analysis Questions

To achieve the business task, I will ansIr the following questions:

1.  How do annual members and casual riders use Cyclistic bikes differently?
2.  Why would casual riders buy Cyclistic annual memberships?
3.  How can Cyclistic use digital media to influence casual riders to become members?

Moreno has assigned me the first question to ansIr: **How do annual members and casual riders use Cyclistic bikes differently?**

## Prepare

### Data Source

I used Cyclistic's historical trip data to analyze and identify trends from July 2022 to June 2023 of Cyclistic trip data from [divvy-tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html).

The data has been made available by Motivate International Inc. under this [license](https://ride.divvybikes.com/data-license-agreement).

This is public data that you can use to explore how different customer types are using Cyclistic bikes. But note that data-privacy issues prohibit you from using riders' personally identifiable information. This means that you won't be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.

### Data Organization

The data is organized into 12 files, each representing a month from July 2022 to June 2023. The columns in these datasets include `ride_id`, `rideable_type`, `started_at`, `ended_at`, `start_station_name`, `start_station_id`, `end_station_name`, `end_station_id`, `start_lat`, `start_lng`, `end_lat`, `end_lng`, and `member_casual`.

## Process

RStudio is used to combine the tIlve datasets into one.

5,779,444 × 13

### Data Combining

R code: [Data Combining](https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/01.%20Combining.R)

All tIlve datasets are combined into a single dataset named "all_trips". The resultant structure of "all_trips" is 5,779,444 rows and 13 columns.

### Data Exploration

As a next step, I am doing an exploratory data analysis to get to know the structure of the data and to look for dirty data.
R code: [Data Exploration](https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/02.%20Exploration.R)

- Data structure:

<img src="https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/images/structure.png" alt="Alt Text" width="300">

- NA values per column:

<img src="https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/images/isNA.png" alt="Alt Text" width="700">

The station name and ID columns have the highest proportion of missing values, accounting for approximately 15% of the dataset. Note that this columns are

- Duplicated data:

<img src="https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/images/duplicated.png" alt="Alt Text" width="200">

There is no duplicated data.

- Distinct values in 'member_casual' column:

<img src="https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/images/distinct_usertype.png" alt="Alt Text" width="400">

There are 2 unique values in `member_casual`.

- Distinct character lengths in 'ride_id' column:

<img src="https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/images/distinct_charlength.png" alt="Alt Text" width="400">

All `ride_id` values have length of 16.


### Data Cleaning and Transformation

R code: [Data Cleaning and Transformation](https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/03.%20Cleaning%20and%20transforming.R)

In this section, I detail the steps taken to clean and transform the raw data from the `all_trips` dataset. The objective is to prepare the data for analysis, ensuring its quality and relevance.

### Step 1: Creating a Backup Dataset

To preserve the integrity of the original data, I create a backup dataset named `all_trips_v2`. This allows us to work with a copy while retaining the original data.

### Step 2: Calculating Ride Duration

I calculate the ride duration in seconds and add it as a new column, ride_duration_sec.

### Step 3: Converting to Minutes

To facilitate analysis, I convert the ride duration from seconds to minutes and store it in the ride_duration_min column.

### Step 4: Formatting Duration

I format the ride duration into HH:MM:SS format, both as character and numeric types.

### Step 5: Handling Outliers

I identify and handle potential outliers:

- Counting the rows with a ride duration of more than a day.
- Counting the number of negative values in the ride_duration_sec column.

### Step 6: Creating Filtered Dataset

I create a new dataset, all_trips_v3, by filtering out non-negative values in the ride_duration_sec column.

### Step 7: Removing Unnecessary Columns

To focus on relevant data, I remove columns not needed for our analysis, including station-related columns and location data.

### Step 8: Extracting Time Components

I extract additional time-related information, including the started hour, day of the Week, and month, to aid in our analysis.

The resulting dataset, all_trips_v3, is now prepared for analysis with the necessary transformations and cleaning steps applied.


  
## Analyze and Share

R code: [Data Analysis](https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/04.%20Analysis.R)
Data Visualization: [Tableau](https://public.tableau.com/app/profile/samekj.jurado/viz/Bike-ShareTripData/HourvsAvgDur)

In this section, I conduct a descriptive analysis of the cleaned and transformed dataset, `all_trips_v3`. This analysis provides valuable insights into the usage patterns of Cyclistic's bike-sharing service by different user types and various time-related factors.

### Analyzing Ridership Data by User Type and Day of the Week

I analyze ridership data by user type (member or casual) and day of the Week. The `day_of_ride` dataset contains the following information:

<img src="https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/images/trips_dow.png" alt="Alt Text" width="400">
<img src="https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/images/duration_dow.png" alt="Alt Text" width="400">

- `member_casual`: User type (member or casual).
- `day_of_week`: Day of the Week.
- `number_of_rides`: Number of rides.
- `avg_duration_minutes`: Average ride duration in minutes.

### Analyzing Ridership Data by User Type and Started Hour

I further explore ridership data by user type and the hour at which rides started. The `hour_of_ride` dataset contains the following information:

<img src="https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/images/trips_hour.png" alt="Alt Text" width="400">
<img src="https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/images/duration_hour.png" alt="Alt Text" width="400">

- `member_casual`: User type (member or casual).
- `started_hour`: Hour of ride start.
- `number_of_rides`: Number of rides.
- `avg_duration_minutes`: Average ride duration in minutes.

### Analyzing Ridership Data by User Type and Month of Ride

I analyze ridership data by user type and the month in which rides occurred. The `month_of_ride` dataset contains the following information:

<img src="https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/images/trips_month.png" alt="Alt Text" width="400">
<img src="https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/images/duration_month.png" alt="Alt Text" width="400">

- `member_casual`: User type (member or casual).
- `month`: Month of the ride.
- `number_of_rides`: Number of rides.
- `avg_duration_minutes`: Average ride duration in minutes.

The descriptive analysis provides insights that will guide our marketing strategies to convert casual riders into annual members.




