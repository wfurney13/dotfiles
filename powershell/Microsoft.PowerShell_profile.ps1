oh-my-posh init pwsh --config "Z:\themes\them1.json" | Invoke-Expression

#choco install terminal-icons.powershell
Import-Module -Name Terminal-Icons

function b { cd ..}
$env:PATH += ";S:\bin\FreeDirCLI\"

Set-Alias gcp Get-Clipboard
Set-Alias cl clang++	
Set-Alias vim nvim
Set-Alias home "C:\Users\wfurn\PowershellScripts\home.ps1"
Set-Alias bash "Z:\bin\cygwin64\cygwin.bat"
Set-Alias xpo explorer
Set-Alias ranger lf

Set-PSReadLineOption -PredictionViewStyle ListView


function sdrive {
fd S:\SteamLibrary\steamapps\common
}

function dl {
fd -d
}

function server {
ssh server 
	}
function activate {
.\env\Scripts\Activate.ps1
}

function l2 ($arg) {
	if ($null -eq $arg)
		{
	.\bin\Release\net7.0\llama2.cs.exe Stories110M.bin
	}
	if ($null -ne $arg)
		{
.\bin\Release\net7.0\llama2.cs.exe Stories110M.bin -i $arg
	}
		}

function winutil {
irm christitus.com/win | iex
}

function reboot {
	shutdown /r /t 0
	}

function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function sd ($time)
    {
        shutdown /s /t $time
    }

#if a process is running for argument stop it
function term ($process) {
    get-process $process|stop-process
}


function gc ($message)
{
    git commit -m $message
}

function ga
{
    git add --all
}

function gp
{
    git push
}

function gco ($branch)
{
    git checkout -b $branch
}

#go function searches for an ".exe" of the argument passed in, if it finds mutliple, the user can choose
#which to open. If the process is already running, the user can choose to restart it or just try to run it

#function depends on everything search CLI 
#https://www.voidtools.com/support/everything/command_line_interface
function gof ($process) {
    $out = es -r $process\.exe$


    if ($null -eq $out ) {
        Write-Output "Process not found."
        $go = 0
    }
    if ($null -ne $out) {
        $Seperator = "`n"
        $outSeperated = $out.split($Seperator)

        if ($null -eq $outSeperated[1]) {
            $outGo = 1
        }

        #multiple processes, display to user and choose
        if (  $null -ne $outSeperated[1] ) {
            Write-Host "Multiple possible processes to launch. Please choose the process that you want.`n"
            Write-Host $outSeperated -Separator "`n" 
            $choice = Read-Host
            $outChoice = $outSeperated[$choice - 1]


        

            if ($choice -gt $outSeperated.count -or $choice -lt 1) {
                do {
                    Write-Host "Please choose the process that you want. IE: 1 for the first, 2 for the second, etc."
                    Write-Host $outSeperated -Separator "`n" 
                    $choice = Read-Host
                    $outChoice = $outSeperated[$choice - 1]
                } while (
                    $choice -gt $outSeperated.count -or $choice -lt 1 
                )
                #if the choice is good, set out equal to that item
            }

            if ($null -ne $outChoice ) {
                $out = $outChoice
                $outGo = 1
            }

        }
        if (Get-Process $process -ErrorAction SilentlyContinue | select ProcessName) {
            $confirmation = Read-Host "$process is already running! Would you like to restart it?"
            if ($confirmation -eq 'y') {
                start-process $out -ErrorAction Inquire
            }
            if ($confirmation -ne 'y') {
                $alternative = Read-Host "Would you like to terminate the process?"

                if ($alternative -eq 'y') {
                    term $process
                }
    
                if ($alternative -ne 'y') {
                    Write-Host "$process is running..."
                }
            }
    
        }
        elseif ($null -ne $out -and $null -ne $outGo) {
            start-process $out -ErrorAction Inquire
        }
    }
}

function clrb {
    Clear-RecycleBin -ErrorAction Inquire
    Write-Output "Recycle Bin Cleared"
}


function aria ($command) {
    aria2c -d H:\Torrents --seed-time=0 $command
}

function getip {
    Get-NetAdapter | where Name -eq "Local Area Connection" | Select-Object InterfaceDescription, Status
    (Invoke-WebRequest https://ipinfo.io/ip).Content
}

function procmon {
    start-process procmon64.exe
}

function sounds {
    control mmsys.cpl sounds
}

function drun {
    dotnet run
}

function yt {
        Start-Process -FilePath 'https://www.youtube.com'
    }
    
function edge ($command) {


    if ($null -eq $command) { #open a new window if "edge"
        go Application\\msedge 
    }
    if ($command -eq "youtube") { #open youtube if "edge youtube"
        yt #call yt function
    }
    if ($command -eq "reddit") {
        Start-Process -FilePath 'https://www.reddit.com'

    }
        if ($command -eq "twitter") {
        Start-Process -FilePath 'https://www.twitter.com'

    }
    if ($command -eq "mail") {
        Start-Process -FilePath 'https://mail.google.com/mail/u/0/#inbox'

    }

    $commands = "youtube", "close", "reddit", "mail"

#if "edge x" where x is not in list of commands ^^, set "x" to the clipboard, open google, 
#wait 1.5, paste the clipboard, send enter 
    if ($command -notin $commands -and $null -ne $command) {
#        go Application\\msedge 
        Set-Clipboard $command
        Add-Type -AssemblyName System.Windows.Forms
        Start-Process -FilePath 'https://www.google.com'
        Start-Sleep -Seconds 1.5
        [System.Windows.Forms.SendKeys]::SendWait('^{v}')
        [System.Windows.Forms.SendKeys]::SendWait('{ENTER}')
    }


#if "edge close" stop all edge processes
    if ($command -eq "close") {
        Get-Process msedge | Stop-Process
    }        

}

cd C:\
cls
