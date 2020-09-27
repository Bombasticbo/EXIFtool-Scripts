@echo off
rem sets EXIF dates and file date to value parsed from filename, sets 9:00 if filename is in WhatsApp format
if ~%1 == ~ goto error
rem parse filename for date info and use to set datetime
rem @"c:\Program Files (x86)\GeoSetter\tools\exiftool.exe" "-alldates<$filename" %1
rem if filename in Whatsapp format (=time unknown) set time to 9:00 to (in order avoid having the incremental numbers as minutes and being off by a day due to DST)
rem @"c:\Program Files (x86)\GeoSetter\tools\exiftool.exe" "-alldates<${filename;$_=substr($_,0,13)} 09:00" -if "$filename =~ /^IMG-\d{8}-WA\d{4}\.*/" %1
rem set filedate
rem @"c:\Program Files (x86)\GeoSetter\tools\exiftool.exe" "-filemodifydate<DateTimeOriginal" "-filecreatedate<DateTimeOriginal" %1

rem all in one command
@"c:\Program Files (x86)\GeoSetter\tools\exiftool.exe" -overwrite_original "-alldates<filename" %1 -execute ^
 -overwrite_original  "-alldates<${filename;$_=substr($_,0,13)} 09:00" -if "$filename =~ /^IMG-\d{8}-WA\d{4}\.*/"  %1 -execute ^
 "-filemodifydate<DateTimeOriginal" "-filecreatedate<DateTimeOriginal" %1
goto exit

:error
@echo Handling error: Drag the folder containing the pictures on this command

:exit

pause