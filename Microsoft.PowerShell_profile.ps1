# Sometimes, when loading a profile, there is a lot of text before it is loaded
# so we just clear it to reduce noise.
clear

function GoTo-Coding { Set-Location -Path "C:\dev" }
Set-Alias repos GoTo-Coding -Option AllScope

function GoTo-NvimConfig {
    if (-not $env:XDG_CONFIG_HOME -or $env:XDG_CONFIG_HOME -eq "") {
        Write-Host "Error: The environment variable 'XDG_CONFIG_HOME' is not defined or is empty." -ForegroundColor Red
    } else {
        Set-Location -Path "$env:XDG_CONFIG_HOME\nvim"
    }
}
Set-Alias nc GoTo-NvimConfig -Option AllScope

function Start-VisualStudio {
param ([string]$Path)

	if ($Path) {
		Start-Process -FilePath "devenv.exe" -ArgumentList "`"$Path`""
	} else {
		Start-Process -FilePath "devenv.exe"
	}
}
Set-Alias vs Start-VisualStudio -Option AllScope

# Git Aliases
function Get-GitStatus { & git status }
New-Alias -Name gs -Value Get-GitStatus -Force -Option AllScope

function Get-GitCommit { & git commit -ev }
New-Alias -Name gc -Value Get-GitCommit -Force -Option AllScope

function Get-GitAdd { & git add --all }
New-Alias -Name ga -Value Get-GitAdd -Force -Option AllScope

function Get-GitPush { & git push }
New-Alias -Name gps -Value Get-GitPush -Force -Option AllScope

function Get-GitPull { & git pull }
New-Alias -Name gpl -Value Get-GitPull -Force -Option AllScope

function Get-GitCheckout { & git checkout $args }
New-Alias -Name gco -Value Get-GitCheckout -Force -Option AllScope

function Get-GitBranch { & git branch $args }
New-Alias -Name gb -Value Get-GitBranch -Force -Option AllScope

function ChangeDirectory-Fzf { 
    & cd (fzf --walker dir,follow --walker-root c:\ --walker-skip Windows,'Program Files','Program Files (x86)',ProgramData)
}
New-Alias -Name cdc -Value ChangeDirectory-Fzf -Option AllScope

function Dotnet-Build { & dotnet build }
New-Alias -Name db -Value Dotnet-Build -Force -Option AllScope

function Dotnet-Run { & dotnet run }
New-Alias -Name dr -Value Dotnet-Run -Force -Option AllScope

function Reload-Profile { . $PROFILE }
New-Alias -Name source -Value Reload-Profile -Force -Option AllScope
