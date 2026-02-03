@echo off
setlocal enabledelayedexpansion

REM Prompt for the folder containing the videos
set /p folder="Enter the folder path where the videos are located: "

REM If the user doesn't provide a path, use the current directory
if "%folder%"=="" (
    set folder=%cd%
)

cd /d "%folder%"

:menu
echo ========================================
echo   Video Utility Script using FFMPEG
echo ========================================
echo 1. Batch Video Resizer (high, medium, low)
echo 2. Video Joiner
echo 3. Video Cutter
echo 4. Exit
echo ========================================
set /p choice="Choose an option (1-4): "

if "%choice%"=="1" goto resize
if "%choice%"=="2" goto join
if "%choice%"=="3" goto cut
if "%choice%"=="4" exit
goto menu

:resize
echo ----------------------------------------
echo  Select Quality for Resizing:
echo  1. High
echo  2. Medium
echo  3. Low
set /p quality="Choose quality (1-3): "

if "%quality%"=="1" set resolution=1920x1080
if "%quality%"=="2" set resolution=1280x720
if "%quality%"=="3" set resolution=640x360

for %%f in ("%folder%\*.mkv" "%folder%\*.mp4" "%folder%\*.avi") do (
    echo Resizing %%f to %resolution%...
    ffmpeg -i "%%f" -vf scale=%resolution% -c:a copy "%folder%\resized_%%~nf_!resolution!.mkv"
)
echo Resizing complete!
goto menu

:join
echo Joining all videos based on numerical order in filename...
for %%f in ("%folder%\*.mkv") do (
    echo file '%%f' >> "%folder%\mylist.txt"
)
ffmpeg -f concat -safe 0 -i "%folder%\mylist.txt" -c copy "%folder%\output_combined.mkv"
del "%folder%\mylist.txt"
echo Videos have been joined into output_combined.mkv
goto menu

:cut
set /p file="Enter the video filename to cut (e.g., video.mkv): "
set /p start="Enter start time (HH:MM:SS): "
set /p end="Enter end time (HH:MM:SS): "
for %%f in ("%file%") do set filename=%%~nf
ffmpeg -i "%folder%\%file%" -ss %start% -to %end% -c copy "%folder%\cut_%filename_%start%-%end%.mkv"
echo Video cut complete!
goto menu