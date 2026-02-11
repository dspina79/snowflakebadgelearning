select $1
from @uni_kishore/updated_feed
(file_format => ff_json_logs);


copy into game_logs
from @uni_kishore/kickoff
file_format = (format_name=FF_JSON_LOGS);

copy into game_logs
from @uni_kishore/updated_feed
file_format = (format_name=FF_JSON_LOGS);


create view LOGS AS
select raw_log:agent::text as AGENT
,raw_log:datetime_iso8601::TIMESTAMP_NTZ as DATETIME_ISO8601
,raw_log:user_event::text as USER_EVENT
,raw_log:user_login::text as USER_LOGIN
,raw_log 
from game_logs;


select * from logs where user_login like '%pra%';


select 
RAW_LOG:ip_address::text as IP_ADDRESS
,*
from ags_game_audience.raw.LOGS
where RAW_LOG:ip_address::text is not null;


create or replace view LOGS AS
select raw_log:ip_address::text as IP_ADDRESS
,raw_log:datetime_iso8601::TIMESTAMP_NTZ as DATETIME_ISO8601
,raw_log:user_event::text as USER_EVENT
,raw_log:user_login::text as USER_LOGIN
,raw_log 
from game_logs
where raw_log:agent is null;




select parse_ip('100.41.16.160','inet'):ipv4;