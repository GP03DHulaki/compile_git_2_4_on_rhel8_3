@echo off
setlocal

:: Prompt for PostgreSQL previous and new passwords, new user, and new user password
set /p PGPASSWORD="Enter the previous PostgreSQL 'postgres' user password: "
set /p PG_NEW_PASSWORD="Enter the new PostgreSQL 'postgres' user password: "
set /p DB_USER="Enter the database user to add (default 'redmine'): "
set /p DB_USER_PASSWORD="Enter the password for the database user: "

:: Set default user if not provided
if "%DB_USER%"=="" set DB_USER=redmine

:: Change PostgreSQL password
echo Changing password for 'postgres' user...
psql -U postgres -W -c "ALTER USER postgres WITH PASSWORD '%PG_NEW_PASSWORD%';" -h localhost -w

:: Update PGPASSWORD environment variable for new password
set PGPASSWORD=%PG_NEW_PASSWORD%

:: Create the 'bitnami_redmine' database if it does not exist
echo Checking if 'bitnami_redmine' database exists...
psql -U postgres -lqt | cut -d \| -f 1 | grep -qw bitnami_redmine
if errorlevel 1 (
    echo Database 'bitnami_redmine' does not exist, creating...
    psql -U postgres -c "CREATE DATABASE bitnami_redmine;"
) else (
    echo Database 'bitnami_redmine' already exists.
)

:: Add a new user and grant privileges
echo Adding user '%DB_USER%' and granting privileges...
psql -U postgres -d bitnami_redmine -c "CREATE USER %DB_USER% WITH PASSWORD '%DB_USER_PASSWORD%';"
psql -U postgres -d bitnami_redmine -c "GRANT ALL PRIVILEGES ON DATABASE bitnami_redmine TO %DB_USER%;"

echo Script completed.
endlocal
