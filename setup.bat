@echo off

echo Cloning Java Build System...
git clone https://github.com/X-RugvedCodes-X/Java-Program-Build-System.git .
echo.
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
