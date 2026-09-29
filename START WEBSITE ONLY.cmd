@echo off
setlocal
cd /d "%~dp0"

echo ==========================================
echo   Deadlock Ability Draft - Website Only
echo ==========================================
echo.

where dotnet >nul 2>nul
if errorlevel 1 (
    echo ERROR: .NET SDK was not found.
    echo Install .NET 10 SDK from:
    echo https://dotnet.microsoft.com/download/dotnet/10.0
    echo.
    pause
    exit /b 1
)

if not exist "appsettings.json" (
    echo Creating appsettings.json from the example...
    copy /Y "appsettings.example.json" "appsettings.json" >nul
    if errorlevel 1 (
        echo ERROR: Could not create appsettings.json.
        pause
        exit /b 1
    )
)

echo Starting website...
echo.
echo When you see "Now listening on:", copy/open that localhost address.
echo Keep this window open while using the website.
echo Press Ctrl+C here to stop the server.
echo.

dotnet run

echo.
echo Server stopped.
pause
