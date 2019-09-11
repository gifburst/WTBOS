@echo off
title Calculator
color 70
cls

:start
cls
echo Type what you want to do.
echo The options are: addition, subtraction, multiplication, division, squaring, and cubing.
echo If you want to close the calculator, then type exit.
set /p input=:
if %input%==addition goto addition
if %input%==add goto addition
if %input%==subtraction goto subtraction
if %input%==subtract goto subtraction
if %input%==multiplication goto multiplication
if %input%==multiply goto multiplication
if %input%==division goto division
if %input%==divide goto division
if %input%==square goto square
if %input%==squaring goto square
if %input%==cube goto cube
if %input%==cubing goto cube
if %input%==close goto exit
if %input%==exit goto exit
echo Unknown request
ping 127.0.0.1 -n 6 >nul
goto start
:addition
cls
echo Choose the first number to add.
set /p num1=
cls
echo Choose the second number to add.
set /p num2=
cls
set /a Answer=%num1%+%num2%
echo %num1%^+%num2%^=%Answer%
echo.
echo Press any button to continue.
pause >nul
goto start
:subtraction
cls
echo Choose the first number to subtract.
set /p num1=
cls
echo Choose the second number to subtract.
set /p num2=
cls
set /a Answer=%num1%-%num2%
echo %num1%^-%num2%^=%Answer%
echo.
echo Press any button to continue.
pause >nul
goto start
:multiplication
cls
echo Choose the first number to multiply.
set /p num1=
cls
echo Choose the second number to multiply.
set /p num2=
cls
set /a Answer=%num1%*%num2%
echo %num1%^*%num2%^=%Answer%
echo.
echo Press any button to continue.
pause >nul
goto start
:division
cls
echo Choose the first number to divide.
set /p num1=
cls
echo Choose the second number to divide.
set /p num2=
cls
set /a Answer=%num1%/%num2%
echo %num1%^/%num2%^=%Answer%
echo.
echo Press any button to continue.
pause >nul
goto start
:square
cls
echo Type in the number that you want to square.
set /p num1=
cls
set /a Answer=%num1%*%num1%
echo %num1% squared is %Answer%
echo.
echo Press any button to continue.
pause >nul
goto start
:cube
cls
echo Type in the number that you want to cube.
set /p num1=
cls
set /a Answer=%num1%*%num1%*%num1%
echo %num1% cubed is %Answer%
echo.
echo Press any button to continue.
pause >nul
goto start
:exit
cls
exit