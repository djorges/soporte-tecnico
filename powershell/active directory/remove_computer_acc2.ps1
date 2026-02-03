$computerName = "Comp01-Renamed"

$computer = Get-ADComputer -Identity $computerName -ErrorAction SilentlyContinue

if(-not $computer) {
    Write-Host "Computer account '$computerName' does not exist. No action needed."
    return
}

Disable-ADAccount -Identity $computerName

Get-ADComputer $computerName -Properties * |
Export-Clixml "C:\backup\$computerName.xml"

Remove-ADComputer -Identity $computerName -Confirm:$false