/*-----------------
Create a non-management user named NoMgr. 
Show the code of how your would grant access to the database(hr_db), 
but revoke access to the salary data.
-------------------*/

CREATE USER NoMgr WITH PASSWORD 'ABC@123';

GRANT CONNECT ON DATABASE hr_db TO NoMgr;
GRANT USAGE ON SCHEMA hr_schema TO NoMgr;
GRANT SELECT ON ALL TABLES IN SCHEMA hr_schema TO NoMgr;

REVOKE SELECT ON hr_schema.salary FROM NoMgr;
