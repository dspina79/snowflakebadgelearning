use role accountadmin;
grant EXECUTE MANAGED TASK on account to SYSADMIN;

--switch back to sysadmin
use role sysadmin;


USER_TASK_MANAGED_INITIAL_WAREHOUSE_SIZE = 'XSMALL'