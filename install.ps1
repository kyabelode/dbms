# --------------------------------------------
# SQL Practicals Installer for Windows (PowerShell)
# --------------------------------------------
$SRC_OWNER = "Sarthakzzzzz"
$SRC_REPO = "exams"
$SRC_BRANCH = "main"
$SRC_SUBDIR = "sql"
$TARBALL_URL = "https://codeload.github.com/$SRC_OWNER/$SRC_REPO/zip/refs/heads/$SRC_BRANCH"

# Destination: Documents\home
$PREFIX = Join-Path $HOME "Documents\home"
$FORCE = $false

Write-Host "⬇️  Downloading source from GitHub..."
$TMP = New-TemporaryFile
$ZIP = "$TMP.zip"
Invoke-WebRequest -Uri $TARBALL_URL -OutFile $ZIP -UseBasicParsing

Write-Host "📦 Extracting only '$SRC_SUBDIR'..."
$EXTRACT_DIR = Join-Path $env:TEMP "sql_extract_$(Get-Random)"
Expand-Archive -Path $ZIP -DestinationPath $EXTRACT_DIR -Force

# Path to SQL folder after extraction
$SQL_PATH = Join-Path $EXTRACT_DIR "$SRC_REPO-$SRC_BRANCH\$SRC_SUBDIR"

if (-Not (Test-Path $SQL_PATH)) {
    Write-Error "❌ Could not find subdirectory '$SRC_SUBDIR' in the archive."
    exit 1
}

Write-Host "📁 Copying files to $PREFIX ..."
New-Item -ItemType Directory -Force -Path $PREFIX | Out-Null
cmd /c "xcopy `"$SQL_PATH`" `"$PREFIX`" /E /I /Y >nul"

Write-Host "✅ Installation complete!"
Write-Host "📂 Files are located at: $PREFIX"

# Cleanup
Remove-Item $ZIP -Force
Remove-Item $EXTRACT_DIR -Recurse -Force
