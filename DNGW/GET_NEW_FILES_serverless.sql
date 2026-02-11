create or replace task AGS_GAME_AUDIENCE.RAW.GET_NEW_FILES
	schedule='5 minute'
    USER_TASK_MANAGED_INITIAL_WAREHOUSE_SIZE = 'XSMALL'
	as copy into ags_game_audience.raw.pl_game_logs
    from @AGS_GAME_AUDIENCE.RAW.UNI_KISHORE_PIPELINE
    file_format = (format_name=ags_game_audience.raw.FF_JSON_LOGS);