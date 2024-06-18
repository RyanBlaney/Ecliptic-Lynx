@echo off

:: Function to check if a command exists
:: Usage: call :command_exists <command_name>
:command_exists
where %1 >nul 2>&1
if %errorlevel% neq 0 (
    echo %1 is not installed. Please install %1 and try again.
    exit /b 1
)
exit /b 0

:: Check if Git is installed
call :command_exists git
if %errorlevel% neq 0 exit /b 1

:: Check if Mix is installed
call :command_exists mix
if %errorlevel% neq 0 exit /b 1

:: Clone the repository
git clone https://github.com/RyanBlaney/Ecliptic-Lynx.git ecliptic_lynx
if %errorlevel% neq 0 (
    echo Failed to clone the repository.
    exit /b 1
)
cd ecliptic_lynx

:: Install dependencies and compile the project
mix deps.get
if %errorlevel% neq 0 (
    echo Failed to get dependencies.
    exit /b 1
)
mix escript.build
if %errorlevel% neq 0 (
    echo Failed to build the project.
    exit /b 1
)

:: Ensure the user's bin directory exists
if not exist "%USERPROFILE%\bin" mkdir "%USERPROFILE%\bin"

:: Move the executable to the user's bin directory
move ecliptic_lynx "%USERPROFILE%\bin\exlynx"
if %errorlevel% neq 0 (
    echo Failed to move the executable.
    exit /b 1
)

:: Add the bin directory to PATH if it's not already there
setlocal enabledelayedexpansion
set FOUND=0
for %%i in ("%PATH:;=" "%") do (
    if /i "%%~i"=="%USERPROFILE%\bin" (
        set FOUND=1
        goto :FOUND
    )
)
:FOUND
if !FOUND! equ 0 (
    setx PATH "%PATH%;%USERPROFILE%\bin"
)

:: Cleanup: Go back to the parent directory and delete the cloned repository
cd ..
rmdir /s /q ecliptic_lynx

echo Executable moved to %USERPROFILE%\bin\exlynx. Ensure %USERPROFILE%\bin is in your PATH.
pause

