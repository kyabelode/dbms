# --------------------------------------------
# Exam Practicals Installer for Windows (PowerShell)
# Hosted in: kyabelode/dbms
# Fetches files from: Sarthakzzzzz/exams
# --------------------------------------------

$SRC_OWNER = "Sarthakzzzzz"
$SRC_REPO = "exams"
$SRC_BRANCH = "main"
$TARBALL_URL = "https://codeload.github.com/$SRC_OWNER/$SRC_REPO/zip/refs/heads/$SRC_BRANCH"

# Default install directory: Documents\home
$PREFIX = Join-Path $HOME "Documents\home"
$FORCE = $false

Write-Host "⬇️  Downloading Exam Practicals from GitHub ($SRC_OWNER/$SRC_REPO)..."

# Temporary paths
$TMP = New-TemporaryFile
$ZIP = "$TMP.zip"
Invoke-WebRequest -Uri $TARBALL_URL -OutFile $ZIP -UseBasicParsing

Write-Host "📦 Extracting repository..."
$EXTRACT_DIR = Join-Path $env:TEMP "exam_extract_$((Get-Random))"
Expand-Archive -Path $ZIP -DestinationPath $EXTRACT_DIR -Force

# Path to repository contents
$REPO_PATH = Join-Path $EXTRACT_DIR "$SRC_REPO-$SRC_BRANCH"

if (-Not (Test-Path $REPO_PATH)) {
    Write-Error "❌ Could not find repository contents in the archive."
    exit 1
}

Write-Host "📁 Installing to $PREFIX ..."
New-Item -ItemType Directory -Force -Path $PREFIX | Out-Null

# Copy files — overwrite existing
robocopy $REPO_PATH $PREFIX /E /NFL /NDL /NJH /NJS /nc /ns /np > $null

Write-Host "✅ Installation complete!"
Write-Host "📂 Files are located at: $PREFIX"

# Cleanup
Remove-Item $ZIP -Force
Remove-Item $EXTRACT_DIR -Recurse -Force
