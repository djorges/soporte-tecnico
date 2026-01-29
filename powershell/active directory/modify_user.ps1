$username = "jdoe"
$title = "Senior Developer"

$user = Get-ADUser -Identity $username -ErrorAction SilentlyContinue

if ($null -eq $user) {
    Write-Host "Usuario no encontrado"
    return
}

Set-ADUser -Identity $username -Title $title