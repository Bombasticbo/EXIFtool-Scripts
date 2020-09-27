@echo off
rem writes filename to title tags (to be displayed by e.g. Picasa)
if ~%1 == ~ goto error
rem @"c:\Program Files (x86)\GeoSetter\tools\exiftool.exe" -L -overwrite_original "-Basename>xmp:description" %1
rem @"c:\Program Files (x86)\GeoSetter\tools\exiftool.exe" -L -m -overwrite_original "-Basename>ImageDescription" %1
rem @"c:\Program Files (x86)\GeoSetter\tools\exiftool.exe" -L -overwrite_original "-Basename>Caption-Abstract" "-DateTimeOriginal>FileModifyDate" %1
rem @"c:\Program Files (x86)\GeoSetter\tools\exiftool.exe" -overwrite_original "-DateTimeOriginal>FileModifyDate" %1
@"c:\Program Files (x86)\GeoSetter beta\tools\exiftool.exe" -L -m -P -overwrite_original "-Basename>ImageDescription" "-Basename>Caption-Abstract" %1
goto exit

:error
@echo Handling error: Drag the folder containing the pictures on this command

:exit

pause