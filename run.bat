@echo off
setlocal

set OUT_DIR=out

REM ================================
REM CHECK IF CLASSES EXIST
REM ================================
if not exist "%OUT_DIR%" (
  echo ERROR: No compiled classes found. Please run build_recursive first.
  exit /b 1
)

REM ================================
REM RUN MAIN CLASS
REM ================================
REM Replace with your main class (with package)
echo Running Your Java Application...
echo.
echo ===============================================
java -cp "%OUT_DIR%" com.rugved.main.Main
echo ===============================================
echo.
echo Execution Successfull
endlocal
