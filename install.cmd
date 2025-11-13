  @echo off
:: --------------------------------------------
:: Exam Practicals Installer (Pure CMD, uses curl+tar)
:: Hosted in: kyabelode/dbms
:: Downloads from: Sarthakzzzzz/exams
:: --------------------------------------------

set SRC_OWNER=Sarthakzzzzz
set SRC_REPO=exams
set SRC_BRANCH=main
set TARBALL_URL=https://codeload.github.com/%SRC_OWNER%/%SRC_REPO%/tar.gz/refs/heads/%SRC_BRANCH%

:: Default install directory
set PREFIX=%USERPROFILE%\Documents\home

echo.
echo 🧩 Exam Practicals Installer
echo --------------------------------------------
echo Downloading Exam Practicals from GitHub...
echo.

:: Create temp folder
set TMPDIR=%TEMP%\exam_tmp_%RANDOM%
mkdir "%TMPDIR%" >nul 2>&1

:: Download tarball
curl -L "%TARBALL_URL%" -o "%TMPDIR%\src.tar.gz"

if not exist "%TMPDIR%\src.tar.gz" (
    echo ❌ Download failed.
    exit /b 1
)

echo 📦 Extracting files...
tar -xf "%TMPDIR%\src.tar.gz" -C "%TMPDIR%" >nul 2>&1

:: Copy the repository contents
echo 📁 Installing into: "%PREFIX%"
xcopy "%TMPDIR%\%SRC_REPO%-%SRC_BRANCH%" "%PREFIX%" /E /I /Y >nul

echo ✅ Installation complete!
echo 📂 Files are in: "%PREFIX%"
echo.

:: Cleanup
rmdir /s /q "%TMPDIR%" >nul 2>&1

echo Press any key to exit...
pause >nul
