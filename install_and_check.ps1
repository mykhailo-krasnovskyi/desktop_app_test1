$installerUrl = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"
$installerPath = "$env:TEMP\chrome_installer.exe"
$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"

Write-Output "Downloading Chrome installer..."
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

Write-Output "Installing Chrome..."
Start-Process -FilePath $installerPath -ArgumentList "/silent /install" -Wait -NoNewWindow


if (Test-Path $chromePath) {
    Write-Output "Chrome is installed successfully!"
    exit 0  
} else {
    Write-Output "Chrome installation failed!"
    exit 1  
}
