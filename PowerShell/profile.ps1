
# This profile.ps1 file is executed when PowerShell starts up.
# To change the value of $profile, you must first create the variable in your Windows PowerShell profile.
# To create the variable, type the following command:
# $profile = $profile.CurrentUserAllHosts
# To view the value of $profile, type the following command:
# $profile
# To create a profile, type the following command:
# New-Item -path $profile -type file -force
# To view the contents of your profile, type the following command:
# Get-Content $profile
# To edit your profile, type the following command:
# ise $profile
function init {

    # get the current host object
    $ps = $host.ui.RawUI

    # set the window title, buffer size, window size, and foreground/background colors
    $ps.Windowtitle = "PowerShell " + $host.version.major + "." + $host.version.minor + " - " + $host.name
    $ps.BackgroundColor = "Black"
    $ps.ForegroundColor = "White"
    $ps.CursorSize = 10
    $ps.WindowSize = New-Object System.Management.Automation.Host.Size(50,10)
    $ps.WindowPosition = New-Object System.Management.Automation.Host.Coordinates(0,0)

    # remove default content
    Clear-Host

    # set the default directory 
    Set-Location C:\Programming\

    # set the default prompt
    Write-Host "PowerShell Console `n" -ForegroundColor Green
    Write-Host "Date:  " -ForegroundColor White -NoNewline
    Write-Host (Get-Date -Format d) -ForegroundColor Red
    Write-Host "Time:  " -ForegroundColor White -NoNewline
    Write-Host (Get-Date -Format t) -ForegroundColor Red
    Write-Host "User: "$env:USERNAME -ForegroundColor White
    Write-Host "Host: "$env:COMPUTERNAME -ForegroundColor White
    Write-Host "`n"

    # set execution policy
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
}

init

# load scripts 
. C:\Scripts\google.ps1
. C:\Scripts\week.ps1










