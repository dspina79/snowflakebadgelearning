--make a note of how many rows you have in the table
select count(*)
from AGS_GAME_AUDIENCE.ENHANCED.LOGS_ENHANCED;

--Run the task to load more rows
execute task AGS_GAME_AUDIENCE.RAW.LOAD_LOGS_ENHANCED;

--check to see how many rows were added (if any! HINT: Probably NONE!)
select count(*)
from AGS_GAME_AUDIENCE.ENHANCED.LOGS_ENHANCED;

