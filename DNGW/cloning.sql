create table ags_game_audience.enhanced.LOGS_ENHANCED_BU 
clone ags_game_audience.enhanced.LOGS_ENHANCED;


MERGE INTO ENHANCED.LOGS_ENHANCED e
USING RAW.LOGS r
ON r.user_login = e.GAMER_NAME
WHEN MATCHED THEN
UPDATE SET IP_ADDRESS = 'Hey I updated matching rows!';