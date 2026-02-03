$username = "cgarcia"
$password = Read-Host "Ingrese contraseña" -AsSecureString


if(Get-ADUser -Filter {SamAccountName -eq $username}) {
    Write-Host "User $username already exists."
    return
}

New-ADUser `
    -Name "Carlos Garcia" `
    -GivenName "Carlos" `
    -Surname "Garcia" `
    -SamAccountName $username `
    -UserPrincipalName "$username@domain.com" `
    -Path "OU=Users,DC=domain,DC=com" `
    -AccountPassword $password `
    -Enabled $true `
    -ChangePasswordAtLogon $true