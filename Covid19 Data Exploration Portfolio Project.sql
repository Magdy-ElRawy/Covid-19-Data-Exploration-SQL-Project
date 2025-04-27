
--Covid19 Data Exploration SQL Project

use [Covid19 Data Exploration]

select *
from CovidDeaths
order by 3,4

--------------------------------------------------------------------------------------------

--Looking at total cases, total deaths, and total deaths to total_cases percentage

select location, date, total_cases, total_deaths, round((total_deaths/total_cases) * 100, 2) as 'deaths %'
from CovidDeaths
order by 1,2

--------------------------------------------------------------------------------------------

--Looking at total cases, population, and total infected population percentage per location per date
  
select location, date, total_cases, population, (total_cases/population) * 100  as 'Infected_population_%'
from CovidDeaths
order by 1,2

--------------------------------------------------------------------------------------------

--Looking at total cases, population, and total infected population percentage per location 

select location, (max(total_cases)/max(population)) * 100  as 'Infected_population_%'
from CovidDeaths
group by location
order by 1,2

/*
select location, (sum(new_cases)/max(population)) * 100  as 'Infected_population_%'
from CovidDeaths
group by location
order by 1,2
*/

--------------------------------------------------------------------------------------------

--Looking at countries with highest infection rate compared to population

select location, population, max(total_cases) as Highest_Infection_Count, max(round((total_cases/population)* 100, 2))  as Percent_Population_Infected
from CovidDeaths
group by location, population
order by Percent_Population_Infected desc

--------------------------------------------------------------------------------------------

--Showing countries with highest death count per population.

select location, max(total_deaths) as Total_Death_Count
from CovidDeaths
where continent is not null
group by location
order by Total_Death_Count desc

--------------------------------------------------------------------------------------------

--Looking at death count by continent

select continent, max(total_deaths) as Total_Death_Count
from CovidDeaths
where continent is not null
group by continent
order by Total_Death_Count desc

--------------------------------------------------------------------------------------------

--Global Statistics by date

select date, SUM(new_cases) as Total_New_Cases , SUM(new_deaths) as Total_New_Deaths, round((SUM(new_deaths) / SUM(new_cases))*100, 2) as Death_Percentage
from CovidDeaths
where continent is not null
group by date
order by 1,2 desc

--------------------------------------------------------------------------------------------

--Looking at total population vs cumulative vaccinations

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(vac.new_vaccinations) over(partition by dea.location order by dea.date, dea.location) as Cumulative_Vaccinations
from CovidDeaths dea join CovidVaccinations vac
on vac.location = dea.location and vac.date = dea.date
where dea.continent is not null
order by 2,3

--------------------------------------------------------------------------------------------

--Looking at population, new vaccinations, cumulative vaccinations, vaccinations percentage of population

with Cumulative_Vaccinations_Table(location, date, population, new_vaccinations, Cumulative_Vaccinations)
as
(
select dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(vac.new_vaccinations) over(partition by dea.location order by dea.date, dea.location) as Cumulative_Vaccinations
from CovidDeaths dea join CovidVaccinations vac
on vac.location = dea.location and vac.date = dea.date
where dea.continent is not null
)
select *, ROUND((Cumulative_Vaccinations/population)*100,4) as vaccinations_percentage_of_pop
from Cumulative_Vaccinations_Table
order by 1,2

--------------------------------------------------------------------------------------------

--Figuring out table structure

select column_name, data_type
from information_schema.columns
where table_name = 'CovidVaccinations';


alter table CovidVaccinations 
alter column new_vaccinations int







