# winget install JanDeDobbeleer.OhMyPosh -s winget
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/1_shell.copy.omp.json" | Invoke-Expression
oh-my-posh init pwsh --config "$env:posh_theme" | Invoke-Expression

# COMPLETION SCRIPTS
Import-Module posh-git
. $HOME\OneDrive\Documents\PowerShell\Scripts\.docker-completion.ps1
. $HOME\OneDrive\Documents\PowerShell\Scripts\.minikube-completion.ps1
. $HOME\OneDrive\Documents\PowerShell\Scripts\.kubectl-completion.ps1

#CUSTOM ENV
$env:editor = "'C:\Program Files\Neovim\bin\nvim.exe'" 
$env:pyf = "$env:onedrive\Documents\!stpk\python"
$env:posh_theme = "$env:onedrive\Documents\PowerShell\1_shell.custom.omp.json"

# homebrew 'where' for powershell
function locate ([string]$cmd) {
    (Get-Command $cmd).Source
}
function pyf { 
    Set-Location $env:pyf 
}

function setenv ([string]$case) {

    switch ($case) {
        'srv-a' {
            $env:port = 5000
            $env:target_url = "http://localhost:5001/health_check"
            $env:role = "service-a"
            Write-Output  "env set role=$env:role, port=$env:port, target=$env:target_url" 
        }
        'srv-b' {
            $env:port = 5001
            $env:target_url = "http://localhost:5000/health_check"
            $env:role = "service-b"
            Write-Output "env's set role=$env:role, port=$env:port, target=$env:target_url"
        }

        Default { Write-Output "Unexpected case: $case" }
    }
}

#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58

