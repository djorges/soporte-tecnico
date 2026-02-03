New-AdUser -Name "Carlos" 
-GivenName "Carlos" 
-Surname "Garcia" 
-SamAccountName "cgarcia" 
-UserPrincipalName "cgarcia@domain.com"
-Path "OU=Users,DC=domain,DC=com"
-AccountPassword (ConvertTo-SecureString "MySecurePassword123" -AsPlainText -Force) 
-Enabled $true