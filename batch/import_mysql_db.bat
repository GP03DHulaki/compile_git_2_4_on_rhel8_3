@echo off
SET dbUser=yourUsername
SET dbPassword=yourPassword
SET dbName=yourDatabaseName
SET backupFile=path\to\your\backup\file.sql

REM -- Import the backup file into the specified database --
mysql -u %dbUser% -p%dbPassword% %dbName% < %backupFile%

echo Database has been imported successfully.
