@echo off
setlocal enabledelayedexpansion

REM ================================
REM VALIDATE ARGUMENT
REM ================================
if "%~1"=="" (
  echo ERROR: Please provide module name
  echo Usage: build ^<moduleName^>
  exit /b 1
)

set MODULE=%~1

REM ================================
REM PATHS
REM ================================
set SRC_ROOT=src
set OUT_DIR=out
set BASE_PACKAGE=com.rugved

REM ================================
REM PREPARE
REM ================================
if not exist "%SRC_ROOT%" (
  echo ERROR: src directory not found
  exit /b 1
)

if not exist "%OUT_DIR%" mkdir "%OUT_DIR%"

REM ================================
REM COLLECT JAVA FILES
REM ================================
echo Compiling Java source files...

set FILES=
for /r "%SRC_ROOT%" %%f in (*.java) do (
  set "FILES=!FILES! "%%f""
)

REM ================================
REM COMPILE
REM ================================
javac -g -d "%OUT_DIR%" -sourcepath "%SRC_ROOT%" %FILES%
if errorlevel 1 exit /b 1

REM ================================
REM RUN
REM ================================
set MAIN_CLASS=%BASE_PACKAGE%.%MODULE%.Main

echo.
echo Running: %MAIN_CLASS%
echo =================================================================
java -cp "%OUT_DIR%" %MAIN_CLASS%
echo =================================================================

echo Build and run completed.
endlocal
