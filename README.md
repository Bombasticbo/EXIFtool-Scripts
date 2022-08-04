# EXIFtool-Scripts
Scripts I use to automatically modify EXIF data tags of jpgs.

Different scripts write...
## date from filename to EXIF datetime
Why?
Because WhatsApp and Signal remove all EXIF Data of a photo. Only the date (+time in Signal) of reception is written to the filename and filedate.
## filedate to EXIF datetime
Why?
Because the filedate is changed when copying a backup of the WhatsApp folder back to the internal storage.

## filename to title fields
Why?
Because Picasa displays under an image not the filename, but the IPTC caption.

## EXIFDate to FileDate
Why?
Because the file date may be changed by editing or copying via FTP, MTP etc. and it's handy to be able to sort the images by file date in a file browser or viewer

## HowTo:
Use in Windows. (For Linux swap ' and " in the exiftool command. And the rest of the batch file, of course.)

A: Drag one or more file(s) or directory and drop it on the respective script in the Explorer (not in Total Commander).

Or

B: call from commandline as

    [scriptname] [filename].jpg

As in

    FileDate2EXIF.cmd "IMG-20200924-WA0002 Meaningful manually assigned title.jpg"

The Whatsapp filename may be appended by an additional string. If it contains spaces, add quotation marks around it.
