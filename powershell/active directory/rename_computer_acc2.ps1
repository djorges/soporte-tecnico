$oldName = "Comp01"
$newName = "Comp01-Renamed"

# Validate old computer name
$computer = Get-ADComputer -Identity $oldName -ErrorAction SilentlyContinue

if (-not $computer) {
    Write-Host "Computer '$oldName' does not exist."
    return
}

# Validate new computer name
if ( Get-ADComputer -Filter "Name -eq '$newName'") {
    Write-Host "The'$newName' is already in use."
    return
}

# Rename the computer account
try {
    Rename-ADObject `
        -Identity $computer.DistinguishedName `
        -NewName $newName `
        -ErrorAction Stop

    Write-Host "Renamed computer '$oldName' to '$newName' successfully."
}
catch {
    Write-Host "Exception occurred:"
    Write-Host $_.Exception.Message
}