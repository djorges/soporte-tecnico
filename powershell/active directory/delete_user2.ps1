$username = "jdoe"

$user = Get-ADUser -Identity $username -ErrorAction SilentlyContinue

if (-not $user) {
    Write-Host "Usuario no existe"
    return
}

Disable-ADAccount -Identity $username

Get-ADUser $username -Properties * | Export-Clixml "C:\backup\$username.xml"

Write-Host "Usuario deshabilitado y respaldado. No eliminado."
