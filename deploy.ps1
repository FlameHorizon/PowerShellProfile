$source = "Microsoft.PowerShell_profile.ps1"
$destination = $PROFILE
$forceOverwrite = $false

# Check for the -y flag
if ($args -contains "-y") {
    $forceOverwrite = $true
}

if (Test-Path $destination) {
    if ($forceOverwrite) {
        Copy-Item -Path $source -Destination $destination -Force
        Write-Host "File overwritten successfully." -ForegroundColor Green
    } else {
        $response = Read-Host "The file '$PROFILE' already exists. Do you want to overwrite it? (y/n)"
        if ($response -ieq "y") {
            Copy-Item -Path $source -Destination $destination -Force
            Write-Host "File overwritten successfully." -ForegroundColor Green
        } else {
            Write-Host "Operation cancelled." -ForegroundColor Yellow
        }
    }
} else {
    Copy-Item -Path $source -Destination $destination
    Write-Host "File copied successfully." -ForegroundColor Green
}
