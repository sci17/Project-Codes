@echo off

setlocal enabledelayedexpansion

set /p tablesize= Enter number: 

echo.
echo.

set "header="

for /L %%i in (1,1,%tablesize%) do (
    set "header=!header!    %%n"
)

echo !header!
echo. 

for /L %%i in (1,1,%tablesize%) do (
    set "row=%%n"

    for /L %%j in (1,1,%tablesize%) do (
        set /a "curval=%%i*%%j"
        set "row=!row!  !curval!"
    )

    echo !row!
)

endlocal

