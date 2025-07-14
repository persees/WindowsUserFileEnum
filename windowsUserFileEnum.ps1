$ErrorActionPreference = 'Continue'

$userFolders = Get-ChildItem -Path "C:\Users" -Directory
foreach($userFolder in $userFolders) {
    try {
        Get-ChildItem -Path $userFolder.FullName -Recurse -ErrorAction Stop
    } catch [System.UnauthorizedAccessException] {
        Write-Warning "Something went wrong while enumerating $userFolder : $($_.Exception.Message)"
    }
}
