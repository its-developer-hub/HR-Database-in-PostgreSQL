--Question 1: Return a list of employees with Job Titles and Department Names
select distinct e.emp_nm, j.job_title, d.dept_nm
FROM hr_schema.employment em
JOIN hr_schema.employee e ON em.emp_id = e.emp_id
JOIN hr_schema.job j ON em.job_id = j.job_id
JOIN hr_schema.department d ON em.dept_id = d.dept_id
;

--Question 2: Insert Web Programmer as a new job title

INSERT INTO HR_SCHEMA.JOB (job_title)
values('Web Programmer')
;

--Question 3: Correct the job title from web programmer to web developer

UPDATE HR_SCHEMA.JOB
SET JOB_TITLE = 'Web Developer'
WHERE JOB_TITLE = 'Web Programmer'
;

--Question 4: Delete the job title Web Developer from the database

DELETE FROM HR_SCHEMA.JOB
WHERE JOB_TITLE = 'Web Developer'
;

--Question 5: How many employees are in each department?

SELECT d.dept_nm, count(em.emp_id)
FROM hr_schema.employment em
JOIN hr_schema.department d ON em.dept_id = d.dept_id
group by d.dept_nm;


--Question 6: Write a query that returns current and past jobs 
--(include employee name, job title, department, manager name, start and end date for position)
-- for employee Toni Lembeck.

select distinct e.emp_nm, j.job_title, d.dept_nm, mgr.emp_nm as manager, em.start_dt, em.end_dt
FROM hr_schema.employment em
JOIN hr_schema.employee e ON em.emp_id = e.emp_id
JOIN hr_schema.employee mgr ON em.manager_id = mgr.emp_id
JOIN hr_schema.job j ON em.job_id = j.job_id
JOIN hr_schema.department d ON em.dept_id = d.dept_id
where e.emp_nm = 'Toni Lembeck';
