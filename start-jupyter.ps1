# -------------------------------
# Set execution policy (process only)
# -------------------------------
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force

# -------------------------------
# Change to project directory
# -------------------------------
$ProjectDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $ProjectDir

# -------------------------------
# Activate virtual environment
# -------------------------------
$VenvActivate = ".\.venv\Scripts\activate"

if (-Not (Test-Path $VenvActivate)) {
    Write-Error "Virtual environment not found at $VenvActivate"
    exit 1
}

& $VenvActivate

# -------------------------------
# Start Jupyter Lab
# -------------------------------
jupyter lab
