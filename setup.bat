@echo off

echo Starting the Setup...
echo.
echo Cleaning unnecessary Git files...
rmdir /s /q .git
del README.md
del .gitignore

echo.
call build

echo.
echo Setup completed successfully.

