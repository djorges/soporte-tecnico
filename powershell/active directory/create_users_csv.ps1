# takes user data from a CSV file and generates new user accounts in Active Directory (AD) using that information.
Import-Csv "C:\path\to\users.csv" | ForEach-Object {
    New-AdUser -Name $_.Name 
    -GivenName $_.FirstName 
    -Surname $_.LastName 
    -SamAccountName $_.Username 
    -UserPrincipalName "$($_.Username)@domain.com" 
    -Path "OU=Users,DC=domain,DC=com" 
    -AccountPassword (ConvertTo-SecureString $_.Password -AsPlainText -Force) 
    -Enabled $true
}