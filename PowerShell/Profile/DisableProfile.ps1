# Disable the current user's PowerShell profile
# Usage: .\DisableProfile.ps1

# Get the current user's profile path
$profilePath = $profile

# Check if the profile exists
if (-not (Test-Path $profilePath)) {
    Write-Host "Profile not found at $profilePath"
    return
}

try {
    # Rename the profile to disable it
    Rename-Item -Path $profilePath -NewName "$profilePath.disabled"
}
catch {
    Write-Host "Failed to disable profile at $profilePath"
    Write-Host $_.Exception.Message
    return 
}


# Check if the profile was renamed
if (Test-Path $profilePath) {
    Write-Host "Failed to disable profile at $profilePath"
    return
}

# Notify the user that the profile was disabled
Write-Host "Disabled profile at $profilePath"
