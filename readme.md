# PowerShell Profile

## Instalation

You can deploy this profile using `deploy.ps` file. It does not require admin rights. After deploy,
reload your session. Note, you can add `-y` to forcefully overwrite previous profile.

When you get `UnauthorizedAccess` while running `deploy.ps`, allow `bypass` exection policy for `CurrentUser`. More on that [about_Execution_Policies](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.5)

```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser
```

## Reloading profile in session

You can reload profile and apply changes without restarting terminal:

```powershel
. $PROFILE
```

## Setting up user variables

Some aliases require user variables to exist in the system.

- `PATH` - variable has to contain location of following applications
    - Git
    - Visual Studio
- `XDG_CONFIG_HOME` - points to location where configuration of `nvim` is. Default is `~/AppData/Local/`. Read more on [neovim.io](https://neovim.io/doc/user/starting.html#%24XDG_CONFIG_HOME)

## Locate your PowerShell Profile file (optional)

To find out where, in your system, PowerShell stores your profile execute following command:

```powershell
$PROFILE
```

If file does not exist, you can create one at `$PROFILE` location:

```powershell
if (-not (Test-Path -Path $PROFILE)) {
    # If it doesn't exist, create the directory if necessary and the file
    New-Item -Path $PROFILE -ItemType File -Force
    Write-Host "The profile file was created at $PROFILE"
} else {
    Write-Host "The profile file already exists at $PROFILE"
}
```
