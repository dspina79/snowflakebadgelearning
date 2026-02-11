copy into ags_game_audience.raw.pl_game_logs
from @AGS_GAME_AUDIENCE.RAW.UNI_KISHORE_PIPELINE
file_format = (format_name=ags_game_audience.raw.FF_JSON_LOGS);


select * from ags_game_audience.raw.pl_game_logs;

execute task ags_game_audience.raw.get_new_files;


select count(*) from ags_game_audience.raw.pl_game_logs;


