# Covid-19-Data-Exploration-SQL-Project

Project Overview
This project is an exploratory analysis of global COVID-19 data using SQL.
The goal is to practice and demonstrate data exploration skills by extracting meaningful insights from pandemic data, such as infection rates, mortality rates, vaccination progress, and global trends over time.

I used Microsoft SQL Server to query, manipulate, and analyze datasets containing COVID-19 cases, deaths, and vaccination records.

Datasets
CovidDeaths: Contains data on daily reported cases, deaths, population, and more, for each location.

CovidVaccinations: Contains data on vaccination counts by location and date.

Key SQL Concepts Applied
Data Aggregation: Using SUM(), MAX(), and window functions like SUM() OVER (PARTITION BY...) for cumulative analysis.

Joins: Combining deaths and vaccinations datasets to derive deeper insights.

CTE (Common Table Expression): For cleaner cumulative vaccination calculations.

Window Functions: Tracking cumulative totals over time.

Data Type Management: Understanding and altering table schemas when necessary.

Data Cleaning: Filtering null values and non-country data entries.

Analysis Highlights
Total cases, total deaths, and death rates by location and date.

Infection rates compared to population across countries.

Countries and continents with the highest death counts.

Global trends of new cases, new deaths, and their percentages over time.

Vaccination progress: tracking cumulative vaccinations and the percentage of the vaccinated population per location.

Sample Insights
Identified countries with the highest infection rates relative to their population size.

Revealed death percentages per reported case across different regions.

Monitored global vaccination rollout progress.

Aggregated global daily trends to observe the pandemic's overall trajectory.

