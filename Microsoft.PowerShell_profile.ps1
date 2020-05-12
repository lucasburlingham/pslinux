<# ininate loop variable #>
$i = 1

function sudo([string]$Command) { 
    Start-Process powershell $Command -Verb runAs
}

Set-Alias less more

function dnsdomainname() {
    Get-ADDomain
    <# 
    .SYNOPSIS
        Identical to the command in Linux. Shows the name of the AD Domain, if avaliable.

    .EXAMPLE
        dnsdomainname

    .NOTES
        Author: Lucas Burlingham
        Last Edit: 2020-05-05
        Version 1.0 - initial stable release/version
    #>
}
function winconfig {
    msconfig
    <# 
    .SYNOPSIS
        Fun spin off of the raspi-config and dietpi-config found on Raspberrian based systems
        (Pure Raspbian and DietPi Respectively.)
    .EXAMPLE
        winOS-config

    .NOTES
        Author: Lucas Burlingham
        Last Edit: 2020-05-05
        Version 1.0 - initial stable release/version
    #>
} 

function bashrc ([string]$Command) {
    Start-Process notepad.exe $profile
    <# 
    .SYNOPSIS
        This command opens the current user's PowerShell profile ($profile) in Notepad for quick editing. 
        NOTE: This is comparable to a shortcut for editing the .bashrc file on Linux.
    .EXAMPLE
        bashrc
    .NOTES
        Author: Lucas Burlingham
        Last Edit: 2020-05-05
        Version 1.0 - initial stable release/version
    #>
}

function top {
    while (1) { Get-Process | Sort-Object -desc cpu | Select-Object -first 30; Start-Sleep -seconds 2; Clear-Host }
    <# 
    .SYNOPSIS
        This command simulates the top process viewer native to Unix-like systems.
    .EXAMPLE
        top
    .NOTES
        Author: Cubert (see link below), implementation by Lucas Burlingham
        Last Edit: 2020-05-04
        Version 1.0 - initial stable release/version
	Link: http://www.squidworks.net/2011/04/how-to-emulate-the-top-command-in-windows/
    #>
}

function ln([string]$arguments) {
    & cmd mklink $arguments -Verb -RunAs
}

function tail([int]$numlines, [string]$arguments) {
    <# 
    .SYNOPSIS
        This script mimics the behavior or the tail command on Unix based systems.
        Requires the use of the Admin terminal at this time.
    
    .EXAMPLE
        tail <integer> <pathtofile>
    .EXAMPLE
        tail 5 C:\windows\minidump --Shows the last 5 lines of the minidump log file. 
    .NOTES
        Author: Lucas Burlingham
        Last Edit: 2020-05-04
        Version 1.0 - initial stable release/version
    #>
    Get-content -tail $numlines $arguments;
}

function spotify([string]$Command) {
    Invoke-Spotify -$command
}

Set-Alias alias Set-Alias

function touch {
    Param (
        [Parameter(Mandatory = $true)]
        [string]$filename
    )
    <# This stuff doesn't actually work rn. TODO: Add last modified date updater for more
    of a linux feel and usage
    $filename = $update 
	$time_now = Get-Date -format "dd MMM yyyy HH:mm:ss"
	$month = Get-Date -format "MMM"
	$day = (get-date).day
	$year = (get-date).year
	#>
    New-Item -Name $filename
}


function nano ([string]$filename) {
    notepad.exe $filename
}
function pico ([string]$filename) {
    notepad.exe $filename
}
function vim ([string]$filename) {
    write.exe $filename
}

function yes ([string]$arg) {
	while($i -eq 1) {
		echo $arg
	}
}

function minetest {
	Start-Process 'C:\Users\Lucas Burlingham\minetest-5.2.0-win64\bin\minetest.exe'
}