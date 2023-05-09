CREATE DATABASE HRanalysis;

USE HRanalysis;

SELECT * FROM hr2;

ALTER TABLE hr2
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;
SELECT * FROM hr2;

DESCRIBE hr2;

SELECT birthdate From hr2;

set sql_safe_updates = 0;

update hr2
set birthdate = case
	when birthdate like '%/%' then date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    when birthdate like '%-%' then date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    else null
end;

Alter table hr2
modify column birthdate date;

update hr2
set hire_date = case
	when hire_date like '%/%' then date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    when hire_date like '%-%' then date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    else null
end;

Alter table hr2
modify column hire_date date;

update hr2
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

Alter table hr2
modify column termdate date;


Alter table hr2 add column age int;



update hr2
set age = timestampdiff(year,birthdate, curdate());
select birthdate,age from hr2;

select 
	min(age) as youngest,
    max(age) as oldest
from hr2;

select count(*) from hr2 where age < 18;

Delete from hr2
where age < 18;


-- Analysis
-- 1. what is the gender breakdown of employees in the company?
select gender, count(*) AS count
from hr2
where termdate = '0000-00-00'
group by gender; 

-- 2. What is the race/ethnicity breakdown of employees in the company?
select race, count(*) as count
from hr2
where termdate = '0000-00-00'
group by race
order by count(*) desc;

-- 3. what is the age distribution of employees in the company?
select
	min(age) as youngest,
    max(age) as oldest
from hr2
where termdate = '0000-00-00';

select 
	case
		when age>=18 and age <=24 then '18-24'
        when age>=25 and age <=34 then '25-34'
        when age>=35 and age <=44 then '35-44'
        when age>=45 and age <=54 then '45-54'
        when age>=55 and age <=64 then '55-64'
        else '65+'
	end as age_group,
    count(*) as count
from hr2
where termdate = '0000-00-00'
group by age_group
order by age_group;

-- 4. how many employees are classified according to gender and age group?
select 
	case
		when age>=18 and age <=24 then '18-24'
        when age>=25 and age <=34 then '25-34'
        when age>=35 and age <=44 then '35-44'
        when age>=45 and age <=54 then '45-54'
        when age>=55 and age <=64 then '55-64'
        else '65+'
	end as age_group,gender,
    count(*) as count
from hr2
where termdate = '0000-00-00'
group by age_group,gender
order by age_group,gender;

-- 5. How many employees work at headquaters versus remote locations?
select location, count(*) as count
from hr2
where termdate = '0000-00-00'
group by location;

-- 6. Average length of employment for employees who have been terminated?
select
	round(avg(datediff(termdate,hire_date))/365,0) as avg_len_emp
from hr2
where termdate <> '0000-00-00' and termdate <= curdate();

-- 7. How does gender distribution vary across departments and job titles?
select department,gender, count(*) as count
from hr2
where termdate = '0000-00-00'
group by department,gender
order by department;

-- 8. what is the distribution of job titles across the company?
select jobtitle, count(*) as count
from hr2
where termdate = '0000-00-00'
group by jobtitle
order by jobtitle desc;

-- 9. which department has the highest turnover rate?
select department,
	total_count,
    terminated_count,
    terminated_count/total_count As termination_rate
from (
	select department,
    count(*) as total_count,
    sum(case when termdate <> '0000-00-00' and termdate <=curdate() then 1 else 0 end) as terminated_count
    from hr2
    group by department
    ) as subquery
order by termination_rate desc;

-- 10. what is the distribution of employees across locations by city and state?
select location_state, count(*) as count
from hr2
where termdate = '0000-00-00'
group by location_state
order by count desc;

-- 11. How has the company's employee count changed overtime based on hire and term dates?
select
	year,
    hires,
    terminations,
    hires - terminations as net_change,
    round((hires - terminations)/hires * 100,2) as net_change_percent
from(
	select year(hire_date) as year,
    count(*) as hires,
    sum(case when termdate <> '0000-00-00' and termdate <= curdate() then 1 else 0 end) as terminations
    from hr2
    group by year(hire_date)
    ) as subquery
order by year asc;

-- 12 what is the tenure distribution for each department?
select department, round(avg(datediff(termdate,hire_date)/ 365),0) as avg_tenure
from hr2
where termdate<= curdate() and termdate<> '0000-00-00'
group by department;

-- 13. What is the Total number of employees in the company?
select count(*) 
from hr2;

-- 14. What is the Total number of employees that has been terminated in the company?
select count(*) 
from hr2
where termdate<> '0000-00-00';

-- 15. What is the Total number of employees that is currently working in the company?
select count(*) 
from hr2
where termdate = '0000-00-00';

-- 14. what is the number of male employees in the company?
select gender,
count(*) as total
from hr2
where gender= 'Male'
group by gender;


-- 14. what is the number of female employees in the company?
select gender,
count(*) as total
from hr2
where gender= 'Female'
group by gender;

-- 14. what is the number of non-conforming employees in the company?
select gender,
count(*) as total
from hr2
where gender= 'Non-Conforming'
group by gender;



select * from hr2;