# Write-Host "Before we start, here's a few question"

# $streaming = Read-Host "Setup streaming? (y/n)"
# $desktop = Read-Host "Setup desktop? (y/n)"

$wslDefault = 'Ubuntu-22.04'

$wslInput = Read-Host "Linux version (Default: Ubuntu-22.04)"

if ($null -eq $wslInput) {
    $wslInput = $wslDefault
}

wsl --install -d $wslInput

Write-Host Installing winget packages

$packages = @(
    # Dev Tools
    'Git.Git',
    'GitHub.cli',
    'LINQPad.LINQPad.7',
    'Microsoft.WindowsTerminal.Preview',
    'Docker.DockerDesktop',
    # 'suse.RancherDesktop',
    # 'icsharpcode.ILSpy',
    'JanDeDobbeleer.OhMyPosh',
    'ScooterSoftware.BeyondCompare4',
    'Postman.Postman',
    'tailscale.tailscale',
    'Microsoft.AzureStorageExplorer',
    'GitExtensionsTeam.GitExtensions',
    'Microsoft.AzureCLI',

    # Editors
    'Microsoft.VisualStudioCode.Insiders',
    'Microsoft.VisualStudio.2022.Professional-Preview',
    'Notepad++.Notepad++',

    # Inspectors
    'Telerik.Fiddler.Classic',
    'Postman.Postman',
    'ChilliCream.BananaCakePop',

    'Giorgiotani.Peazip',
    'calibre.calibre',

    # Browsers
    'Mozilla.Firefox',
    'Google.Chrome',
    'Microsoft.Edge.Dev',
    'Microsoft.Edge.Beta',

    # Chat
    'Discord.Discord',
    'SlackTechnologies.Slack',
    'OpenWhisperSystems.Signal.Beta',

    # Misc
    'Microsoft.Powershell.Preview',
    'Microsoft.PowerToys',
    'Microsoft.OneDrive',
    'NickeManarin.ScreenToGif',
    'Microsoft.Office',

    'OBSProject.OBSStudio',
    'Logitech.Options',
    'Valve.Steam',
    'Plex.PlexMediaServer',
    'Plex.Plexamp',
    'VideoLAN.VLC',
    'qBittorrent.qBittorrent',
    'Krisp.Krisp'
)

$packages | ForEach-Object { winget install --id $_ --source winget }

Write-Host Setting up PowerShell

Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/evilpilaf/system-init/main/windows/setup-powershell.ps1'))
pwsh -c "Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/evilpilaf/system-init/main/windows/setup-powershell.ps1'))"
