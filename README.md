---
title: "Bike Share"
author: "Samekj Jurado"
date: "2023-08-20"
output: github_document
---

# Google Data Analytics Capstone: Cyclistic Case Study

Course: [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)

Data source: [divvy-tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) (accessed on 08/20/23)

## Context

### Scenario

I'm assuming to be a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company's future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve your recommendations, so they must be backed up with compelling data insights and professional data visualizations.

### Cyclistic

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.

Until now, Cyclistic's marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

Cyclistic's finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.

Lily Moreno, the director of marketing and my manager, has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.

## Ask

### Business task

Analyze Cyclistic's historical bike trip data to understand the differences in usage patterns between annual members and casual riders. Additionally, the task involves identifying the motivations and factors that lead casual riders to purchase Cyclistic annual memberships. Furthermore, the goal is to develop effective digital media strategies that can influence casual riders to transition into becoming annual members. Ultimately, the objective is to increase the number of annual members and drive future growth for Cyclistic.

### Analysis Questions

Three questions will guide the future marketing program:

1.  How do annual members and casual riders use Cyclistic bikes differently?
2.  Why would casual riders buy Cyclistic annual memberships?
3.  How can Cyclistic use digital media to influence casual riders to become members?

Moreno has assigned me the first question to answer: **How do annual members and casual riders use Cyclistic bikes differently?**

## Prepare

### Data source

I used Cyclistic's historical trip data to analyze and identify trends from July 2022 to June 2023 of Cyclistic trip data from [divvy-tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html).

The data has been made available by Motivate International Inc. under this [license](https://ride.divvybikes.com/data-license-agreement).

This is public data that you can use to explore how different customer types are using Cyclistic bikes. But note that data-privacy issues prohibit you from using riders' personally identifiable information. This means that you won't be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.

### Data organization

There are 12 files with naming convention of YYYYMM-divvy-tripdata. Each of these files include information for each month from July 2022 to June 2023. The corresponding column names are ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng and member_casual.

## Process

RStudio is used to combine the twelve datasets into one.

5,779,444 × 13

### Combining the data

R code: [Data Combining](https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/01.%20Combining.R)

All twelve datasets are combined into a single dataset named "all_trips". The resultant structure of "all_trips" is 5,779,444 rows and 13 columns.

### Data exploration

R code: [Data Exploration](https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/02.%20Exploration.R)

### Data cleaning

R code: [Data Cleaning and Transformation](https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/03.%20Cleaning%20and%20transforming.R)

## Analyze

R code: [Data Analysis](https://github.com/samekj/Google-DA-Cyclistic-Case-Study/blob/main/04.%20Analysis.R)
