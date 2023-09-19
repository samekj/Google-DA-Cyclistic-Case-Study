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

R Code: [Data Combining](https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/01.%20Combining.R)

All twelve datasets are combined into a single dataset named "all_trips". The resultant structure of "all_trips" is 5,779,444 rows and 13 columns.

### Data Exploration

As a next step, I am doing an exploratory data analysis to get to know the structure of the data and to look for dirty data.
R Code: [Data Exploration](https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/02.%20Exploration.R)

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

**Data Cleaning and Transformation**: [R Code](https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/03.%20Cleaning%20and%20transforming.R)

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

I create a new dataset, `all_trips_v3`, by filtering out non-negative values in the `ride_duration_sec` column and rides with a duration of more than a day (86400 seconds).

### Step 7: Removing Unnecessary Columns

To focus on relevant data, I remove columns not needed for our analysis, including station-related columns and location data.

### Step 8: Extracting Time Components

I extract additional time-related information, including the started hour, day of the Week, and month, to aid in our analysis.

The resulting dataset, all_trips_v3, has a structure of 5,662,257 rows and 11 columns. It is now prepared for analysis with the necessary transformations and cleaning steps applied.

  
## Analyze and Share

**Data Analysis**: [R Code](https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/04.%20Analysis.R)

**Data Visualization**: [Tableau](https://public.tableau.com/app/profile/samekj.jurado/viz/Bike-ShareTripData/BikeType#1)

In this section, I conduct a descriptive analysis of the cleaned and transformed dataset, `all_trips_v3`. This analysis provides valuable insights into the usage patterns of Cyclistic's bike-sharing service by different user types and various time-related factors.

### Bike Type Preferences

The analysis begins by examining the distribution of bike usage by member and casual riders across different bike types. Here's what I discovered:

<img src="https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/images/bike_type.png" alt="Alt Text" width="900">

The members make 59% of the total while remaining 41% constitutes casual riders. Each bike type chart shows percentage from the total. Most used bike is classic bike followed by the electric bike. Docked bikes are used the least by only casual riders.

- Members constitute 59% of all riders, with casual riders making up the remaining 41%.
- When examining bike usage, classic bikes stand out as the most frequently used, representing 46% of total usage. Electric bikes closely follow, accounting for 41% of total usage. Docked bikes, however, are the least popular, primarily among casual riders.

### Temporal Patterns

To gain a comprehensive understanding of user behavior, I explored temporal patterns, considering three dimensions: months of the year, days of the week, and hours of the day.

<img src="https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/images/total_trips.png" alt="Alt Text" width="900">

**Monthly Trends**:
- Both member and casual riders exhibit similar patterns. Peak ridership occurs during the summer months, followed by a gradual decline in the autumn and a notable decrease during the winter months.
- This suggests that the weather likely plays a significant role in bike usage, with more people opting for rides during pleasant, warm months.

**Days of the Week**:
- Member users tend to use bikes more during weekdays, with a decline towards the weekend. This pattern may be indicative of members using bikes for commuting to work or other weekday activities.
- Casual riders, conversely, show peak usage on Saturdays and Sundays. This observation implies that casual riders are more likely to use bikes for leisure and weekend outings.

**Hours of the Day**:
- Both user types present the same pattern, with the particularity that member riders have a peak of usage at around 8pm and at 5pm. Casual riders haver their most usage at 5pm.
-These patterns suggest commuting to and from work trends for member users, while casual riders tend to use bikes more in the late afternoon, possibly for recreational activities.

From the observations, it's evident that members likely use bikes for weekday commuting, while casual riders opt for leisurely rides throughout the day, especially on weekends. Both user types are most active during the warmer months of summer and spring.

When examining the average ride durations:

<img src="https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/images/average_duration.png" alt="Alt Text" width="900">

### Temporal Patterns

- Casual users tend to have longer rides, averaging around 22 minutes per ride.
- In contrast, member users have significantly shorter rides, averaging just 12 minutes per ride.

**Monthly Trends**:
- Across both user types, the trend in ride duration remains relatively constant, with the shortest ride durations occurring during the winter months.
  
**Days of the Week**:
- Casual riders tend to have longer trips on Saturdays and Sundays, indicating that weekends see more extended leisure rides for this group.
- Member users maintain a consistent average ride duration throughout the entire week, with slightly longer rides on Saturdays and Sundays.

**Hours of the Day**:
- Casual riders tend to enjoy longer rides during late morning to early afternoon, from 10am to 2pm, possibly for leisurely daytime cycling. In contrast, they opt for shorter trips in the early morning, between 5 am and 8 am.
- Member users exhibit a steady trend in ride duration throughout the entire day, with no significant fluctuations.

The analysis reveals that casual riders tend to have longer rides, particularly on weekends, reflecting their preference for leisurely cycling. In contrast, member users consistently maintain shorter ride durations, which could be attributed to weekday commuting habits. Overall, ride durations remain relatively stable across both user types, with the shortest durations observed during the winter months. Additionally, the hourly analysis shows that casual riders experience notable variations throughout the day, incrementing their ride durations between 10am and 2pm, while member users exhibit a more consistent trend with no significant fluctuations.

### Starting and Ending Stations

The visual representation below illustrates the contrast between _starting_ stations for **member users** (left pane) and **casual users** (right pane).

<img src="https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/images/start_station.png" alt="Alt Text" width="900">

Upon closer examination, stations with 12,000 or more trips in 2022 reveal interesting insights. Member users utilize a wide array of starting stations, totaling over 40, which are more evenly distributed across the city. This dispersion aligns with the fact that members constitute the majority of riders throughout the year and suggests that members prefer stations near their residences, workplaces and schools, as noted in the previous analysis of trip distribution.

Conversely, casual riders primarily initiate their trips from a smaller set of stations, with only 12 stations meeting the 12,000 trip threshold. These stations are strategically located near points of interest popular among tourists.

The visualization below illustrates the contrast between _ending_ stations for **member users** (left pane) and **casual users** (right pane)

<img src="https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/images/end_station.png" alt="Alt Text" width="900">

Upon a close examination of the map above, a striking similarity emerges with the starting stations. This observation underscores that the stations most frequently utilized by both member and casual users remain consistent, whether as starting or ending points for their rides.

## Summary

Based on the observed patterns, it can be concluded that casual riders tend to embark on longer journeys, approximately twice the duration of member rides, albeit less frequently. Notably, casual riders prefer extended rides during weekends and daytime hours, particularly in the spring and summer seasons, suggesting a recreational purpose behind these longer rides.

| Aspect | Member Riders | Casual Riders |
|--------|---------------|---------------|
| **Time Preferences** | Prefer riding bikes on weekdays during commute hours (8 am & 5 pm) in summer and spring. | Prefer using bikes throughout the day, more frequently over the weekends in summer and spring for leisure activities. |
| **Ride Duration** | Travel more frequently but take shorter rides (approximately half the duration of casual riders' trips). | Travel almost 2 times longer but less frequently than members. |
| **Station Preferences** | Prefer starting and ending their trips near universities, residential areas, commercial districts, and other urban amenities. | Prefer starting and ending their trips near parks, museums, and recreational sites.|

## Act

1. Seasonal Targeting: Concentrate marketing efforts on casual riders during spring and summer, especially near stations close to tourist and recreational sites popular among casual riders.
2. Tailored Memberships: Consider introducing seasonal or weekend-only membership options to align with casual riders' weekend and seasonal riding patterns. Promote these memberships near stations that see higher casual rider activity.
3. Duration Discounts: Encourage longer rides for both casual riders and members by offering discounts for extended ride durations. Promote this at stations that cater to both user types.
