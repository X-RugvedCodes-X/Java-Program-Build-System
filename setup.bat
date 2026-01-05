@echo off

echo Cloning Java Build System...
git clone https://github.com/X-RugvedCodes-X/Java-Program-Build-System.git .

echo.
echo Cleaning unnecessary Git files...
rmdir /s /q .git
del README.md
del .gitignore

echo.
echo Setup completed successfully.
