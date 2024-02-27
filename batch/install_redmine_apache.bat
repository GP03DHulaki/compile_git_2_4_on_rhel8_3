@echo off
SETLOCAL EnableDelayedExpansion

REM -- Copy Apache files --
echo Copying Apache files...
xcopy "C:\path\to\apache-folder" "C:\Apache" /E /I /Y

REM -- Copy Redmine files --
echo Copying Redmine files...
xcopy "C:\path\to\redmine-folder" "C:\Redmine" /E /I /Y

REM -- Install Gems (assuming Ruby is properly set up) --
echo Installing required Gems...
cd C:\Redmine
for %%f in (C:\path\to\gems\*.gem) do (
    gem install "%%f" --local --no-document
)

REM -- Apply custom configuration files --
echo Applying custom configuration files...
xcopy "C:\path\to\config-files" "C:\Redmine\config" /E /I /Y

echo Installation completed!
pause
