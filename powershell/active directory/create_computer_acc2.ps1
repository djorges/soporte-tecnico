$computerName = "CompName01"
$ouPath = "OU=Computers,DC=domain,DC=com"

if (Get-ADComputer -Filter "Name -eq '$computerName'") {
    Write-Host "La computadora ya existe"
    return
}

New-ADComputer `
    -Name $computerName `
    -Path $ouPath `
    -Enabled $true `
    -Description "Equipo del área desarrollo"