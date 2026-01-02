--Load HR_Dataset file data into Raw table in stage schema
CREATE SCHEMA stg_schema;

CREATE TABLE STG_SCHEMA.HR_DATASET_RAW (
 emp_id VARCHAR,
 emp_nm VARCHAR,
 email VARCHAR,
 hire_dt DATE,
 job_title VARCHAR,
 salary DECIMAL,
 department VARCHAR,
 manager VARCHAR,
 start_dt DATE,
 end_dt DATE,
 location VARCHAR,
 address VARCHAR,
 city VARCHAR,
 state VARCHAR,
 education_level VARCHAR
 );
 
 --Replace the file path based on system; Also, convert the excel file to CSV and remove comma in salary fields.
\copy STG_SCHEMA.HR_DATASET_RAW FROM 'C:\Learning\Udacity_DA\hr-dataset.csv' CSV HEADER
;
