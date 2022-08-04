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
rem sets file date to EXIF date (can also be done by IrfanView)

if ~%1 == ~ goto error
rem parse filename for date info and use to set datetime
rem @"c:\Program Files (x86)\GeoSetter\tools\exiftool.exe" "-alldates<$filename" %1
rem if filename in Whatsapp format (=time unknown) set time to 9:00 to (in order avoid having the incremental numbers as minutes and being off by a day due to DST)
rem @"c:\Program Files (x86)\GeoSetter\tools\exiftool.exe" "-alldates<${filename;$_=substr($_,0,13)} 09:00" -if "$filename =~ /^IMG-\d{8}-WA\d{4}\.*/" %1
rem set filedate

rem "-charset filename=UTF8" funzt nicht bei Umlauten im Dateinamen
@"c:\Program Files (x86)\GeoSetter\tools\exiftool.exe" "-charset filename=latin" "-filemodifydate<CreateDate" "-filecreatedate<CreateDate" !params! 

rem echo c:\Program Files (x86)\GeoSetter\tools\exiftool.exe !params!
rem @"c:\Program Files (x86)\GeoSetter\tools\exiftool.exe" -overwrite_original -r "-alldates<filename" !params! -execute ^
rem  -overwrite_original  "-alldates<${filename;$_=substr($_,0,13)} 09:00" -if "$filename =~ /^IMG-\d{8}-WA\d{4}\.*/"  !params! -execute ^
rem -r "-filemodifydate<DateTimeOriginal" "-filecreatedate<DateTimeOriginal" !params!

goto exit

:error
@echo Handling error: Drag the folder containing the pictures on this command
pause
:exit

pause