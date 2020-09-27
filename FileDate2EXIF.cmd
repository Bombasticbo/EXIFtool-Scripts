@echo off
rem writes filename to EXIF dates
if ~%1 == ~ goto error
rem @"c:\Program Files (x86)\GeoSetter\tools\exiftool.exe" "-FileModifyDate>CreateDate" "-CreateDate>DateTimeOriginal" "-CreateDate>ModifyDate" "-CreateDate>FileModifyDate" *.jpg
@"c:\Program Files (x86)\GeoSetter\tools\exiftool.exe" -overwrite_original -P "-FileModifyDate>alldates" %1

goto exit

:error
@echo Handling error: Drag the folder containing the pictures on this command

:exit

pause