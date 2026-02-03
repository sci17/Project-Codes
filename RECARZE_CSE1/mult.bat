@echo off

set /p multiplicand = "Enter your multiplicand: "
set /p limit = "Enter your limit: "



for /l %%i in (1,1,%limit%) do (
    set /a result = multiplicand*%%i
    echo %multiplicand x %%i = !result!
)
pause