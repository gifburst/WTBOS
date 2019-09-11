@echo off
color 70
title Clock
cls
echo.
echo The current date is %date%
echo The current time is %time%
ping 127.0.0.1 -n 6 >nul
exit