/*-----------------
Create a non-management user named NonMgr. 
Show the code of how your would grant access to the database(hr_db), 
but revoke access to the salary data.
-------------------*/

CREATE USER NonMgr WITH PASSWORD 'ABC@123';

GRANT CONNECT ON DATABASE hr_db TO NonMgr;
GRANT USAGE ON SCHEMA hr_schema TO NonMgr;
GRANT SELECT ON ALL TABLES IN SCHEMA hr_schema TO NonMgr;

REVOKE SELECT ON hr_schema.salary FROM NonMgr;
