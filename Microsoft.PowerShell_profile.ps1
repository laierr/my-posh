# winget install JanDeDobbeleer.OhMyPosh -s winget
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/1_shell.copy.omp.json" | Invoke-Expression
oh-my-posh init pwsh --config "$env:onedrive\Documents\PowerShell\1_shell.copy.omp.json" | Invoke-Expression

# COMPLETION SCRIPTS
Import-Module posh-git
. $HOME\OneDrive\Documents\PowerShell\Scripts\.docker-completion.ps1
. $HOME\OneDrive\Documents\PowerShell\Scripts\.minikube-completion.ps1
. $HOME\OneDrive\Documents\PowerShell\Scripts\.kubectl-completion.ps1

#CUSTOM ENV
$env:editor = "'C:\Program Files\Neovim\bin\nvim.exe'" 
$env:pyf = "$env:onedrive\Documents\!stpk\python"

# homebrew 'where' for powershell
function locate ([string]$cmd) {
    (Get-Command $cmd).Source
}
function pyf { 
    Set-Location $env:pyf 
}

#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58

