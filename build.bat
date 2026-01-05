@echo off
setlocal enabledelayedexpansion

set SRC_ROOT=src
set OUT_DIR=out

REM ================================
REM PREPARE
REM ================================
if not exist "%SRC_ROOT%" (
  echo ERROR: src directory not found
  exit /b 1
)

if not exist "%OUT_DIR%" mkdir "%OUT_DIR%"

REM ================================
REM COMPILE ALL JAVA FILES
REM ================================
echo Compiling Java source files recursively...

set FILES=
for /r "%SRC_ROOT%" %%f in (*.java) do (
  set "FILES=!FILES! "%%f""
)

javac -g -d "%OUT_DIR%" -sourcepath "%SRC_ROOT%" %FILES%
if errorlevel 1 exit /b 1

REM ================================
REM RUN YOUR MAIN CLASS
REM ================================
REM Replace with your main class (with package)

echo Running Your Java Application...
echo.
echo java -cp "%OUT_DIR%" com.rugved.main.Main
echo.
echo =================================================================
java -cp "%OUT_DIR%" com.rugved.main.Main
echo =================================================================

echo Build and run completed.
endlocal
