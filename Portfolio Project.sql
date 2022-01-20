Select *
From PortfolioProject..CovidDeaths
where continent is not null
order by 3,4

Select *
From PortfolioProject..CovidVaccinations
where continent is not null
order by 3,4

Select Location, date, total_cases, new_cases, total_deaths, new_deaths, population
From PortfolioProject..CovidDeaths
where continent is not null
order by 1,2

--totalcases vs totaldeaths

Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as deathpercentage
From PortfolioProject..CovidDeaths
where continent is not null
order by 1,2

--total cases vs population

Select Location, date, total_cases, population, (total_cases/population)*100 as casepercentage
From PortfolioProject..CovidDeaths
where continent is not null
order by 1,2

--highest infection rate

Select Location, total_cases, population, (total_cases/population)*100 as casepercentage
From PortfolioProject..CovidDeaths
order by casepercentage desc

--highest death

Select Location, MAX(cast(total_deaths as int)) as Totaldeathcount
From PortfolioProject..CovidDeaths
where continent is not null
Group by location
order by Totaldeathcount desc

--continent

Select continent,MAX(cast(total_deaths as int)) as Totaldeathcount
From PortfolioProject..CovidDeaths
where continent is not null
group by continent
order by Totaldeathcount desc

--world numbers vs date

Select date, SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, (SUM(cast(new_deaths as int))/SUM(new_cases))*100 as Total_deathpercentage
From PortfolioProject..CovidDeaths
where continent is not null
group by date
order by 1,2

--total world numbers

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, (SUM(cast(new_deaths as int))/SUM(new_cases))*100 as Total_deathpercentage
From PortfolioProject..CovidDeaths
where continent is not null
order by 1,2

--population vs vaccination

select dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations
from PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccinations vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
order by 2,3







