@echo off
SET dbUser=yourUsername
SET dbPassword=yourPassword
SET dbName=yourDatabaseName
SET backupFile=path\to\your\backup\file.sql

REM -- Export the specified database to a file --
mysqldump -u %dbUser% -p%dbPassword% %dbName% > %backupFile%

echo Database has been exported successfully.
