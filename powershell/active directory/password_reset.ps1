# This PowerShell script resets a user’s password in Active Directory
$Username = "user1"
$NewPassword = ConvertTo-SecureString "NewPassword123!"

Set-ADAccountPassword - Identity $Username -NewPassword $NewPassword