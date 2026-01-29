# Este script sirve para resetear contraseña, desbloquear usuario, obligar cambio de contraseña en el siguiente login
$username = Read-Host "Ingrese usuario"
$user = Get-ADUser -Identity $username -ErrorAction SilentlyContinue

if($null -eq $user){
    Write-Host "El usuario no existe"
    return
}

$newPassword = Read-Host "Ingrese nueva contraseña" -AsSecureString

Set-ADAccountPassword -Identity $username -NewPassword $newPassword
Unlock-ADAccount -Identity $username
Set-ADUser -Identity $username -ChangePasswordAtLogon $true

Write-Host "Contraseña restablecida correctamente"

