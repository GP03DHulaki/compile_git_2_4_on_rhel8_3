@echo off
setlocal enabledelayedexpansion

REM Change the directory below to the path where your parent folder is located
cd /d E:\path\to\your\parent\folder

REM Log file location
set LOGFILE=fsck_results.log

REM Clear the log file
echo Checking Git repositories on %date% at %time% > %LOGFILE%

REM Loop through each subdirectory
for /d %%i in (*) do (
    pushd %%i
    if exist .git (
        echo Checking %%i
        echo Checking: %%i >> %LOGFILE%
        git fsck --full --strict >> %LOGFILE%
    ) else (
        echo %%i is not a Git repository
        echo %%i is not a Git repository >> %LOGFILE%
    )
    popd
)

echo Done.
echo Check completed on %date% at %time% >> %LOGFILE%
endlocal
