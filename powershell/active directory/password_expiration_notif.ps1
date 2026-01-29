# checks for users whose passwords are about to expire within the next 14 days
$policy = Get-ADDefaultDomainPasswordPolicy
$users = Get-ADUser -Filter {
    Enabled -eq $true -and PasswordNeverExpires -eq $false
} -Properties PasswordLastSet, Mail

foreach ($user in $users) {

    if (!$user.PasswordLastSet -or !$user.Mail) { continue }

    $expirationDate = $user.PasswordLastSet + $policy.MaxPasswordAge
    $daysLeft = ($expirationDate - (Get-Date)).Days

    if ($daysLeft -le 14 -and $daysLeft -gt 0) {
        Send-MailMessage `
            -To $user.Mail `
            -From "admin@domain.com" `
            -Subject "Password expiration in $daysLeft days" `
            -Body "Your password will expire in $daysLeft days. Please change it."
            -SmtpServer "smtp.domain.com"
    }
}