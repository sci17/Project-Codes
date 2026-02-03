@echo off
setlocal enabledelayedexpansion 


set RAR_PATH= "C:\Program Files\WinRAR\Rar.exe"


set /p folderDir = "Enter the path of the folder:"

:compression_level
echo. 
echo Choose Compression Level:
echo 0 = Store
echo 1 = Fastest
echo 2 = Fast
echo 3 = Normal
echo 4 = Good
echo 5 = Best

set /p compression_level = "Enter compression level (0-5):"
if %compression_level% == "" set compression_level= 3
if %compression_level% lss 0 (goto :invalid_input)
if %compression_level% gtr 5 (goto :invalid_input)
goto :next

:invalid_input
echo Invalid level! Choose from 0 to 5 only.
goto :compression_level

set /p password= "Enter a password (leave blank if none): "
    if not "%password%" == "" (
        set command_switch= -p%password%
    )
set /p comment = "Enter a comment(optional): "
    if not "%comment%"=="" (
        echo %comment% > comment.txt
        set command_comment= -zcomment.txt
    )

:delete 
set /p del= "Do you want to delete original folders after compression (y/n)"
if /i "%del%" == "y" (
    for /d %%D in (
        "%folderDir% \*"
    ) do RMDIR /s /q "%%D"
)

if "%folderDir%" == set "folderDir= %CD%" 
if not exist "%folderDir%" (
    echo Invalid directory. 
    pause
    exit /b 1
)

if "%folderDir%" == set "folderDir= %CD%" 
if not exist "%folderDir%" (
    echo Invalid directory. 
    pause
    exit /b 1
)
:start
echo. 
echo Starting compression in %folderDir%
echo. 

for /d %%D in ("%folderDir%\*") do (
    set foldername= %%~nxd
    echo Compressing folder: %foldername%

    set command = "%RAR_PATH%" a -r -m%compression_level% "%%d\*"
    !command!


echo.
echo Compressed Successsfully!
pause 
exit /b 0