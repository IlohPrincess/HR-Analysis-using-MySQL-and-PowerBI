# HR-Analysis-using-MySQL-and-PowerBI


![Screenshot ](https://github.com/IlohPrincess/HR-Analysis-using-MySQL-and-PowerBI/assets/98350804/639682e1-9375-48b4-a484-0e983a4918d9)
## About
This project was a Human Resource Analysis that sought to answer the following questions:
* What is the gender breakdown of employees in the company?
* What is the race/ethnicity breakdown of employees in the company?
* What is the age distribution of employees in the company?
* How many employees are classified according to gender and age group?
* How many employees work at headquarters versus remote locations?
* What is the average length of employment for employees who have been terminated?
* How does the gender distribution vary across departments and job titles?
* What is the distribution of job titles across the company?
* Which department has the highest turnover rate?
* What is the distribution of employees across locations by state?
* How has the company's employee count changed over time based on hire and term dates?
* What is the tenure distribution for each department?
* What is the total number of employees in the company?
* What is the Total number of employees that has been terminated in the company?
* What is the Total number of employees that is currently working in the company?
* what is the number of male employees in the company?
* what is the number of female employees in the company?
* what is the number of non-conforming employees in the company?

## Data Cleaning and Analysis
MySQL was utilized for the data cleaning
* During the cleaning process the data was all labelled as text including the date, these were dealt with.
* In the terminated_date columns, staff that was currently working with the company was assigned the value of '0000-00-00' to fill the blank space.
* A new column age was created to easily visualize the age of the employees to help with analysis.
* In the hire_date column it was observed that some ages were below 18 (967 records), so those in that category was dropped before analysis

## Data Visualization
The result of the analysis was visualized using PowerBI

## Findings
* The company had a total of 21,247 employees.9876 being Female, 10794 being Male and 577 being Non-conforming, out of this number only a total of 17,482 was still current employees and 3765 peoples have had there appoinments terminated
* There are more male employees than female employees.
* Native Hawaiians and American Indians are the least dominant races, while Whites are the most dominant.
* The youngest worker is 20 years old, while the eldest is 57.
* There are five age categories (18-24, 25-34, 35-44, 45-54, and 55-64). The largest group of employees was between the ages of 25 and 34, followed by those between 35 and 44, and the smallest between the ages of 55 and 64.
* A large proportion of employees work on-site as opposed to remotely.
* The average tenure of terminated employees is approximately seven years.
* The gender distribution across departments is relatively proportionate, but men outnumber women on average.
* The department with the highest turnover rate is Marketing, followed by Training. The departments with the lowest turnover rate are Research and Development, Support, and Legal.
* A significant proportion of employees hail from Ohio.
* Over the years, the net change in employees has increased.
* Each department's average tenure is approximately 8 years, with Legal and Auditing having the longest tenure and Services, Sales, and Marketing having the shortest.
