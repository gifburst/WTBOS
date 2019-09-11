@echo off
title Desktop
color 70
:start
cls
echo ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
echo.
echo Type a command, or type help for a list of possible commands.
echo.
set /p command=:

IF /i "%command%" == "clock" GOTO clock
IF /i "%command%" == "help" GOTO help
IF /i "%command%" == "notepad" GOTO notepad
IF /i "%command%" == "notes" GOTO notepad
IF /i "%command%" == "calculator" GOTO calculator

goto error

:calculator
start /max calculator.bat
goto start

:clock
start /max clock.bat
goto start

:help
start /max help.bat
goto start

:notepad
start /max notepad.bat
goto start

:error
(echo Command not found.
ping 127.0.0.1 -n 6 >nul
goto start
)