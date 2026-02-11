create or replace view AGS_GAME_AUDIENCE.RAW.PL_LOGS(
	IP_ADDRESS,
	DATETIME_ISO8601,
	USER_EVENT,
	USER_LOGIN,
	RAW_LOG
) as
select raw_log:ip_address::text as IP_ADDRESS
,raw_log:datetime_iso8601::TIMESTAMP_NTZ as DATETIME_ISO8601
,raw_log:user_event::text as USER_EVENT
,raw_log:user_login::text as USER_LOGIN
,raw_log 
from pl_game_logs
where raw_log:agent is null;


select * from AGS_GAME_AUDIENCE.RAW.PL_LOGS;