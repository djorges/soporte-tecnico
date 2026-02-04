$missingUpdates = Get-WindowsUpdate -AcceptAll -IgnoreReboot

if($missingUpdates){
    # Save the list of missing updates to a file then email it
    $missingUpdates | Out-File "C:\Users\jorge\Downloads\missing_updates.txt"

    Send-MailMessage  `
    -To "admin@domain.com" `
    -From "updates@domain.com" `
    -Subject "Missing Updates Report" `
    -Body "Please find the attached report of missing updates." `
    -SmtpServer "smtp.domain.com" -Attachments "C:\Users\jorge\Downloads\missing_updates.txt"
}