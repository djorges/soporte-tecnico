$username = "jdoe"

$user = Get-ADUser -Identity $username -ErrorAction SilentlyContinue

if (-not $user) {
    Write-Host "Usuario no existe"
    return
}

Remove-ADUser -Identity $username