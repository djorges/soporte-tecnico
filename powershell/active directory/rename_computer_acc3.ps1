$computers = Import-Csv -Path “C:\Path\To\Your\Computers.csv”

foreach($computer in $computers){
    $oldName = $computer.OldName
    $newName = $computer.NewName

    try {
        Rename-Computer -ComputerName $oldName -NewName $newName -DomainCredential (Get-Credential) -Force -Restart
        Write-Host "Successfully renamed $oldName to $newName"
    }
    catch {
        Write-Host "Failed to rename $oldName to $newName. Error: $_"
    }
}