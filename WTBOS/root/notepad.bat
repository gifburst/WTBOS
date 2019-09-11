@echo off
color 70
title Notepad
cd user\notes
:start
color 70
cls
echo.
echo Type new to make a new note, or type load to open an existing note.
echo Type exit to close the notepad.
set /p option=:
IF /i "%option%" == "new" GOTO new
IF /i "%option%" == "load" GOTO load
IF /i "%option%" == "exit" GOTO exit
IF /i "%option%" == "close" GOTO exit
goto error
:exit
cls
cd..
cd..
exit
:new
cls
:name
echo Type a name for your new note using only letters and numbers, no special character.
set /p name=:
cls
goto text
:text 
echo Now type what you want the note to say, and press enter or return when you want to continue.
set /p text=:
cls
goto confirm
:confirm
echo.
echo The name of the note is:
echo %name%
echo.
echo The contents of the note are:
echo %text%
echo.
echo.
echo Type yes to save, or type no to delete the note.
set /p choice=:
IF /i "%choice%" == "yes" GOTO save
IF /i "%choice%" == "no" GOTO delete
goto error
:save
cls
echo Ok, I will save the note.
echo %text% > %name%.txt
ping 127.0.0.1 -n 6 >nul
goto start
:delete
cls
echo Ok, I wont save your note.
ping 127.0.0.1 -n 6 >nul
goto start
:load
cls
echo Here are the saved notes, type the name of one to open it.
echo If you want to go back, type cancel.
echo.
echo -----------------------------------------------------------
echo.
dir
echo.
set /p load=:
:loaded
70
cls
IF /i "%load%" == "cancel" GOTO start
echo.
type %load%.txt
echo.
echo Type Done to go back, type edit to edit this note, or type delete to delete this note.
set /p note-option=:
IF /i "%note-option%" == "done" goto start
IF /i "%note-option%" == "delete" goto delete
IF /i "%note-option%" == "edit" goto edit
echo Unknown option
ping 127.0.0.1 -n 6 >nul
goto loaded
:edit
cls
echo.
echo The note %load% currently says:
type %load%.txt
echo.
echo Type what you want to add to the note
echo.
set /p edit-text=:
:edit-confirm
cls
echo Would you like to add %edit-text% to the note?
echo Type yes to save edit, or type no to cancel.
set /p edit-confirm=:
IF /i "%edit-confirm%" == "yes" goto confirmed-edit
IF /i "%edit-confirm%" == "no" goto start
IF /i "%edit-confirm%" == "cancel" goto start
IF /i "%edit-confirm%" == "exit" goto start
goto edit-confirm
:confirmed-edit
echo %edit-text% > temp-note.txt
type %load%.txt temp-note.txt > temp-note-2.txt
del /f %load%.txt
del /f temp-note.txt
type temp-note-2.txt > %load%.txt
del /f temp-note-2.txt
cls
echo Done!
ping 127.0.0.1 -n 6 >nul
goto start
:delete
color 74
cls
echo Are you sure you want to delete this note?
echo Type delete to delete, or type cancel to cancel.
set /p delete-option=:
IF /i "%delete-option%" == "cancel" goto cancel-delete
IF /i "%delete-option%" == "no" goto cancel-delete
IF /i "%delete-option%" == "exit" goto cancel-delete
IF /i "%delete-option%" == "delete" goto confirm-delete
echo Unknown option
ping 127.0.0.1 -n 6 >nul
goto delete
:confirm-delete
color 70
cls
echo Ok, I will delete your note.
del /f %load%.txt
ping 127.0.0.1 -n 6 >nul
goto start
:cancel-delete
color 70
cls
echo Ok, I wont delete your note.
ping 127.0.0.1 -n 6 >nul
goto start
:error
cls
echo Unknown option, please try again.
ping 127.0.0.1 -n 6 >nul
goto start