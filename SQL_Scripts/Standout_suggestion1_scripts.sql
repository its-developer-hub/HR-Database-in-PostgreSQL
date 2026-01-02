create or replace view hr_schema.hr_dataset
as
select e.emp_id, e.emp_nm, e.email, e.hire_dt, j.job_title, sl.salary_amt, d.dept_nm, mgr.emp_nm as manager, em.start_dt, em.end_dt,
l.location_code as location, a.address_line1 as address, a.city, a.state, ed.education_level
FROM hr_schema.employment em
JOIN hr_schema.employee e ON em.emp_id = e.emp_id
JOIN hr_schema.employee mgr ON em.manager_id = mgr.emp_id
JOIN hr_schema.job j ON em.job_id = j.job_id
JOIN hr_schema.department d ON em.dept_id = d.dept_id
JOIN hr_schema.salary sl ON em.salary_id = sl.salary_id
JOIN hr_schema.location l ON em.location_id = l.location_id
JOIN hr_schema.address a ON l.address_id = a.address_id
JOIN hr_schema.education ed ON e.education_id = ed.education_id
;

select * from hr_schema.hr_dataset limit 5;
