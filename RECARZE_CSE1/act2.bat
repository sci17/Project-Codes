@echo off 
setlocal enabledelayedexpansion

set /p folder_path = "Enter the path of the folder you want to utilized: "
if "%folder_path%"== ""(
    set folder_path=%cd%
)
cd /D "%folder_path%"

:menu 
echo Video Utility using FFMPEG

echo 1. Video Resizer
echo 2. Video Joiner
echo 3. Video Cutter
echo 4. exist
set /p option = "Choosen an option: "

if "%option%" == "1" goto resize 
if "%option%" == "2" goto join 
if "%option%" == "3" goto cut 
if "%option%" == "4" goto exit 

:resize
echo Select the quality for resizing
echo 1. High
echo 2. Medium
echo 3. Low
set /p quality= "Choose the quality (1-3):"

if "%quality%" == "1" set resolution= 1920x1080
if "%quality%" == "2" set resolution = 1280x720
if "%quality%" == "3" set resolution = 640x480

for %%f in ("%folder_path%\*.mkv" "%folder_path%\*.mp4" "%folder_path%\*.avi") do (
    echo Resizing %%f to %resolution%...
    FFMPEG -i "%%f" -vf scale= %resolution% -c:a 
    copy "%folder_path%\resized_%%~nf_!resolution!.mkv"
)
echo Resized successfully!!
goto menu

:join
echo Joining all videos based on numerical order in filename...
for %%f in ("%folder_path%\*.mkv") do (
    echo file '%%f' >> "%folder_path%\mylist.txt"
)
FFMPEG -f concat -safe 0 -i "%folder_path%\mylist.txt" -c copy 
"%folder_path%\output_combined.mkv"
del "%folder_path%\mylist.txt"
echo Videoes have been joined into output_combined.mkv 
goto menu

:cut 
set /p file= "Enter a video filename to cut (ex: vid1.mkv): "
set /p start= "Enter start time (HH:MM:SS): "
set /p end= "Emter end time (HH:MM:SS): "
FFMPEG -i "%folder_path%\%file%" -ss %start% -to %end% -c copy 
"%folder_path%\cut_%~nfile%_%start%-%end%.mkv"
echo Video cut complete!
goto menu
