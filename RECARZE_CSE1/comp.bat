@ECHO off
SETlocal

:: Check if WinRAR is installed
WHERE Rar.exe >nul 2>&1
IF %errorlevel% neq 0 (
    ECHO WinRAR CLI not found! Please install WinRAR and ensure rar.exe is in your PATH.
    EXIT /b 
)


::::::::::::::::
:: USER INPUT ::
::::::::::::::::

:: Get the folder to compress (assumes current directory if not provided)
SET folder_path=%1
IF "%folder_path%"=="" (
    SET folder_path=.
)

:: Prompt for compression level (1-5)
:: Set compression level (0-store...3-default...5-maximal)
SET /p compression_level="Enter compression level (1-5): "
IF not "%compression_level%"=="" IF %compression_level% lss 1 IF %compression_level% gtr 5 (
    ECHO Invalid compression level. Please enter a value between 1 and 5.
    EXIT /b
)

:: Prompt for password protection
SET /p password="Enter password (leave blank for no password): "
IF not "%password%"=="" (
    SET password_switch=-p%password%
)

:: Prompt for text comment
SET /p comment="Enter comment (optional): "
IF not "%comment%"=="" (
    ECHO %comment% > comment.txt
    SET comment_switch=-zcomment.txt
)


:::::::::::::::
:: EXECUTION ::
:::::::::::::::

:: Create the RAR file
for /d %%D in ("%folder_path%\*") do rar.exe a -m%compression_level% %password_switch% %comment_switch% "%%D".rar "%%D"


:::::::::::::::
:: AFTERMATH ::
:::::::::::::::

:: Clean up comment file
IF exist comment.txt del comment.txt

:: Ask if user wants to delete the folder after compression
SET /p delete_folder="Delete subdirectories after compression? (y/n): "
IF /i "%delete_folder%"=="y" (
    for /d %%D in ("%folder_path%\*") do RMDIR /s /q "%%D"
)

:: Notify task completion
ECHO Compression complete! ^G
pause



:::::::::::
:: NOTES ::
:::::::::::

:: >nul - hides the output so that it doesn’t appear on the screen
:: 2>&1 - redirects the standard error (error messages, if any) to the same location as the standard output (in this case, nul)
:: EXIT /b - stops the execution of a batch file
:: SET /p - sets the value of a variable to a line of input from the user
:: for do - a variation of for-loop
:: /d - specifically look for directories (not files).
:: %%D - loop variable, holds value for each iteration
:: ^G - produces beep sound