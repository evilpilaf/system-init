$env:POSH_GIT_ENABLED = $true
Import-Module nvm
Import-Module posh-git

oh-my-posh font install FiraCode | Invoke-Expression
oh-my-posh font install Meslo | Invoke-Expression

oh-my-posh --init --shell pwsh --config ~/craver.omp.json | Invoke-Expression

Import-Module -Name Terminal-Icons