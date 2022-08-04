rem Takes files and folders by drag&drop

@echo off
REM https://stackoverflow.com/questions/5185030/drag-and-drop-batch-file-for-multiple-files/5192427#5192427
setlocal EnableDelayedExpansion

rem *** Take the cmd-line, remove all until the first parameter
rem *** Copy cmdcmdline without any modifications, as cmdcmdline has some strange behaviour
set "params=!cmdcmdline!"
set "params=!params:~0,-1!"
set "params=!params:*" =!"
rem echo params: !params!
rem all in one command

@echo off
rem sets FileCreateDate and all EXIF dates to FileModifyDate
if ~%1 == ~ goto error
@ "c:\Program Files (x86)\GeoSetter\tools\exiftool.exe" -overwrite_original -P "-FileModifyDate>FileCreateDate" "-FileModifyDate>CreateDate" "-FileModifyDate>DateTimeOriginal" "-FileModifyDate>ModifyDate" "-FileModifyDate>MediaCreateDate" "-FileModifyDate>MediaModifyDate" !params!
rem -P (-preserve) Preserve file modification date/time

goto exit

:error
@echo Handling error: Drag the folder containing the pictures on this command
pause
:exit

pause
