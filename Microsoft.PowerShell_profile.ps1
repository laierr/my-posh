# winget install JanDeDobbeleer.OhMyPosh -s winget
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/1_shell.copy.omp.json" | Invoke-Expression
oh-my-posh init pwsh --config "$env:posh_theme" | Invoke-Expression

# COMPLETION SCRIPTS
Import-Module posh-git
# . $HOME\OneDrive\Documents\PowerShell\Scripts\.docker-completion.ps1
# . $HOME\OneDrive\Documents\PowerShell\Scripts\.minikube-completion.ps1
# . $HOME\OneDrive\Documents\PowerShell\Scripts\.kubectl-completion.ps1

#CUSTOM ENV
$env:editor = "'C:\Program Files\Neovim\bin\nvim.exe'" 
$env:pyf = "$env:onedrive\Documents\github\python"
$env:posh_theme = "$env:onedrive\Documents\PowerShell\1_shell.custom.omp.json"

# homebrew 'where' for powershell
function locate ([string]$cmd) {
    (Get-Command $cmd).Source
}

function pyf { 
    Set-Location $env:pyf 
}

function pyinit {
    # Define paths
    $venvPath = ".venv"
    $gitIgnorePath = ".gitignore"
    $requirementsPath = "requirements.txt"
    $readmePath = "README.md"
    $srcDir = "src"
    $testsDir = "tests"

    # Define content for .gitignore
    $gitIgnoreContent = @"
__pycache__
$venvPath
"@

    # Create .gitignore file
    $gitIgnoreContent | Set-Content -Path $gitIgnorePath -Force

    # Create virtual environment if it doesn't exist
    if (-not (Test-Path -Path $venvPath)) {
        Write-Output "Creating virtual environment..."
        python -m venv $venvPath
    } else {
        Write-Output "Virtual environment already exists."
    }

    # Create requirements.txt file (initially empty)
    if (-not (Test-Path -Path $requirementsPath)) {
        New-Item -Path $requirementsPath -ItemType File -Force
        Write-Output "Created requirements.txt file."
    }

    # Create README.md file with basic content
    if (-not (Test-Path -Path $readmePath)) {
        $readmeContent = "# Project Title`n`nProject description here."
        $readmeContent | Set-Content -Path $readmePath -Force
        Write-Output "Created README.md file."
    }

    # Create source and tests directories
    if (-not (Test-Path -Path $srcDir)) {
        New-Item -Path $srcDir -ItemType Directory -Force
        Write-Output "Created src directory."
    }

    if (-not (Test-Path -Path $testsDir)) {
        New-Item -Path $testsDir -ItemType Directory -Force
        Write-Output "Created tests directory."
    }

    # Optionally install essential packages (e.g., pip, setuptools)
    $pipPath = Join-Path -Path $venvPath -ChildPath "Scripts\pip.exe"
    if (Test-Path -Path $pipPath) {
        Write-Output "Installing essential packages..."
        & $pipPath install --upgrade pip setuptools
    }

    # Output activation command for the user
    Write-Output "Python project initialized with .gitignore, virtual environment, README.md, and directory structure."
    Write-Output "To activate the virtual environment, use the following command:"
    Write-Output " .\$venvPath\Scripts\Activate"
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

