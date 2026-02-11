create or replace task AGS_GAME_AUDIENCE.RAW.LOAD_LOGS_ENHANCED
	USER_TASK_MANAGED_INITIAL_WAREHOUSE_SIZE = 'XSMALL'
	after AGS_GAME_AUDIENCE.RAW.GET_NEW_FILES
	as MERGE INTO AGS_GAME_AUDIENCE.ENHANCED.LOGS_ENHANCED e
    USING (SELECT logs.ip_address AS ip_address
, logs.user_login as GAMER_NAME
, logs.user_event as GAME_EVENT_NAME
, logs.datetime_iso8601 as GAME_EVENT_UTC
, city
, region
, country
, timezone as GAMER_LTZ_NAME
, CONVERT_TIMEZONE('UTC', timezone, logs.datetime_iso8601) as game_event_ltz
, DAYNAME(game_event_ltz) as DOW_NAME
, TOD_NAME FROM
    AGS_GAME_AUDIENCE.RAW.PL_LOGS logs
    JOIN IPINFO_GEOLOC.demo.location loc 
    ON IPINFO_GEOLOC.public.TO_JOIN_KEY(logs.ip_address) = loc.join_key
    AND IPINFO_GEOLOC.public.TO_INT(logs.ip_address) 
    BETWEEN start_ip_int AND end_ip_int
    JOIN ags_game_audience.raw.time_of_day_lu tod ON HOUR(game_event_ltz) = tod.hour) r
    ON r.GAMER_NAME = e.GAMER_NAME
    AND r.GAME_EVENT_NAME = e.GAME_EVENT_NAME
    AND r.GAME_EVENT_UTC = e.GAME_EVENT_UTC
    WHEN NOT MATCHED THEN

    INSERT
    VALUES
     (  ip_address
    , GAMER_NAME
    , GAME_EVENT_NAME
    ,  GAME_EVENT_UTC
    , city
    , region
    , country
    , GAMER_LTZ_NAME
    , game_event_ltz
    , DOW_NAME
    , TOD_NAME);