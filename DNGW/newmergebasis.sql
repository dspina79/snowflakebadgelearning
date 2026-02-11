SELECT logs.ip_address AS ip_address
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
    AGS_GAME_AUDIENCE.RAW.ED_PIPELINE_LOGS  logs
    JOIN IPINFO_GEOLOC.demo.location loc 
    ON IPINFO_GEOLOC.public.TO_JOIN_KEY(logs.ip_address) = loc.join_key
    AND IPINFO_GEOLOC.public.TO_INT(logs.ip_address) 
    BETWEEN start_ip_int AND end_ip_int
    JOIN ags_game_audience.raw.time_of_day_lu tod ON HOUR(game_event_ltz) = tod.hour;