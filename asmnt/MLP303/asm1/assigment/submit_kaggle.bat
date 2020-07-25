@echo off
setlocal enabledelayedexpansion

set root_dir=%~dp0
set submit_dir=%root_dir%\submits

if "%1"=="baseline" (

)

if "%1"=="tuned_baseline" (
    set submit_dir=%submit_dir%\tuned_baseline
)

if "%1"=="cross_validation" (
    set submit_dir=%submit_dir%\cross_validation
)

cd %submit_dir%

for /r %%i in (*) do (
    kaggle competitions submit -c home-credit-default-risk -f %%i -m "Baseline"
    timeout /t 10
)

cd %root_dir%
