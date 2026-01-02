@echo off
setlocal enabledelayedexpansion

REM -------------------------------
REM Check argument
REM -------------------------------
if "%~1"=="" (
  echo Usage: build_recursive ClassName
  exit /b 1
)

set CLASSNAME=%~n1
set SRC_ROOT=src
set OUT_DIR=out

REM -------------------------------
REM Find source file
REM -------------------------------
for /f "delims=" %%f in ('where /r "%SRC_ROOT%" %CLASSNAME%.java 2^>nul') do (
  set SRC_FILE=%%f
  goto :found
)

echo Error: %CLASSNAME%.java not found
exit /b 1

:found
echo Found: %SRC_FILE%
echo.

REM -------------------------------
REM Extract package name safely
REM -------------------------------
set PACKAGE=
for /f "tokens=2 delims= " %%p in ('findstr /B /C:"package " "%SRC_FILE%"') do (
  set PACKAGE=%%p
)
set PACKAGE=%PACKAGE:;=%

if not defined PACKAGE (
  echo Error: No package declaration found.
  exit /b 1
)

REM -------------------------------
REM Convert package to folder path
REM -------------------------------
set PKG_PATH=%PACKAGE:.=\%

set PKG_SRC_DIR=%SRC_ROOT%\%PKG_PATH%

echo Package: %PACKAGE%
echo Compiling sources in: %PKG_SRC_DIR%
echo.

REM -------------------------------
REM Create output directory
REM -------------------------------
if not exist "%OUT_DIR%" mkdir "%OUT_DIR%"

REM ------------------------------- 
REM Compile ONLY that package 
REM ------------------------------- 
echo Compiling... 
echo ^> javac -g -cp "%OUT_DIR%" -d "%OUT_DIR%" %PKG_SRC_DIR%\*.java 
javac -g -cp "%OUT_DIR%" -d "%OUT_DIR%" %PKG_SRC_DIR%\*.java 
if errorlevel 1 exit /b 1

REM -------------------------------
REM Run requested class
REM -------------------------------
echo.
echo Running...
echo ^> java -cp "%OUT_DIR%" %PACKAGE%.%CLASSNAME%
echo.
echo ------------------------------
java -cp "%OUT_DIR%" %PACKAGE%.%CLASSNAME%
echo ------------------------------
endlocal