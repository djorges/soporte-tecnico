$groupName = "GG_IT_Developers"
$ouPath = "OU=Groups,DC=domain,DC=com"

if (Get-ADGroup -Filter "Name -eq '$groupName'") {
    Write-Host "El grupo ya existe"
    return
}

New-ADGroup `
    -Name $groupName `
    -GroupScope Global `
    -GroupCategory Security `
    -Path $ouPath `
    -Description "Grupo de desarrolladores del área IT"