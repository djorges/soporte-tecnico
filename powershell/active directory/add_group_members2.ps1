$groupName = "Developers"
$username = "jdoe"

$group = Get-ADGroup -Identity $groupName -ErrorAction SilentlyContinue
$user  = Get-ADUser -Identity $username -ErrorAction SilentlyContinue

if (-not $group -or -not $user) {
    Write-Host "Usuario o grupo inexistente"
    return
}

if (Get-ADGroupMember $groupName | Where-Object SamAccountName -eq $username) {
    Write-Host "El usuario ya pertenece al grupo"
    return
}

Add-ADGroupMember -Identity $groupName -Members $username