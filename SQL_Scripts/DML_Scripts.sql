-----Insert data from staging table to target tables

INSERT INTO HR_SCHEMA.EDUCATION (education_level)
SELECT DISTINCT education_level
FROM STG_SCHEMA.HR_DATASET_RAW
WHERE education_level IS NOT NULL;


INSERT INTO HR_SCHEMA.DEPARTMENT (dept_nm)
SELECT DISTINCT department
FROM STG_SCHEMA.HR_DATASET_RAW
WHERE department IS NOT NULL;


INSERT INTO HR_SCHEMA.JOB (job_title)
SELECT DISTINCT job_title
FROM STG_SCHEMA.HR_DATASET_RAW
WHERE job_title IS NOT NULL;


INSERT INTO HR_SCHEMA.SALARY (salary_amt)
SELECT DISTINCT salary
FROM STG_SCHEMA.HR_DATASET_RAW
WHERE salary IS NOT NULL;

INSERT INTO HR_SCHEMA.ADDRESS (address_line1, city, state)
SELECT DISTINCT  address, city, state
FROM STG_SCHEMA.HR_DATASET_RAW
WHERE address IS NOT NULL;


INSERT INTO HR_SCHEMA.LOCATION (location_code, address_id)
SELECT DISTINCT location, a.address_id
FROM STG_SCHEMA.HR_DATASET_RAW r
JOIN HR_SCHEMA.ADDRESS a
  ON a.address_line1 = r.address
WHERE location IS NOT NULL;


INSERT INTO hr_schema.employee (
    emp_id, emp_nm, email, hire_dt, EDUCATION_ID
)
SELECT DISTINCT
    emp_id,
    emp_nm,
    email,
    hire_dt,
    el.education_id
FROM STG_SCHEMA.HR_DATASET_RAW s
LEFT JOIN hr_schema.education el
    ON s.education_level = el.education_level;


INSERT INTO hr_schema.employment (
    emp_id,
    job_id,
	salary_id,
    dept_id,
    manager_id,
    location_id,
    start_dt,
    end_dt
)
SELECT
    s.emp_id,
    jt.job_id,
    sl.salary_id,
    d.dept_id,
    m.emp_id AS manager_id,
    l.location_id,
    s.start_dt,
    s.end_dt
FROM STG_SCHEMA.HR_DATASET_RAW s
JOIN hr_schema.job jt ON s.job_title = jt.job_title
JOIN hr_schema.department d ON s.department = d.dept_nm
LEFT JOIN hr_schema.employee m ON s.manager = m.emp_nm
JOIN hr_schema.location l ON s.location = l.location_code
JOIN hr_schema.salary sl ON s.salary = sl.salary_amt
JOIN hr_schema.address a ON 
       s.address = a.address_line1
    AND s.city = a.city
    AND s.state = a.state;
	
-------------------------
