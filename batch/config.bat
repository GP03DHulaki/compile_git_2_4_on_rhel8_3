@echo off

REM -- Add your custom paths to the system Path variable --
setx PATH "%PATH%;C:\Your\Path1;C:\Another\Path2" /M

REM -- Add a new system variable --
setx MY_VARIABLE "MyValue" /M

REM -- Add another system variable --
setx ANOTHER_VARIABLE "AnotherValue" /M

echo System variables updated successfully.
