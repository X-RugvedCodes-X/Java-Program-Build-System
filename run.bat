@echo off
setlocal enabledelayedexpansion

REM ================================
REM VALIDATE ARGUMENT
REM ================================
if "%~1"=="" (
  echo ERROR: Please provide module name
  echo Usage: run ^<moduleName^>
  exit /b 1
)

set MODULE=%~1

REM ================================
REM PATHS
REM ================================
set OUT_DIR=out
set BASE_PACKAGE=com.rugved

REM ================================
REM CHECK IF CLASSES EXIST
REM ================================
if not exist "%OUT_DIR%" (
  echo ERROR: No compiled classes found.
  echo Please run build ^<moduleName^> first.
  exit /b 1
)

REM ================================
REM RUN
REM ================================
set MAIN_CLASS=%BASE_PACKAGE%.%MODULE%.Main

echo.
echo Running: %MAIN_CLASS%
echo =================================================================
java -cp "%OUT_DIR%" %MAIN_CLASS%
echo =================================================================

echo Execution Successful
endlocal
