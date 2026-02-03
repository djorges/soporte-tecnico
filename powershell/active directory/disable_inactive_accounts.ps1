$inactiveUsers = Get-ADUser -Filter { 
    LastLogonDate -lt (Get-Date).AddDays(-90) -and Enabled -eq $true
} -Properties LastLogonDate

foreach ($user in $inactiveUsers) {
    Disable-ADAccount -Identity $user.SamAccountName
    Write-Host "Disabled account: $($user.SamAccountName) Last Logon Date: $($user.LastLogonDate)"
}