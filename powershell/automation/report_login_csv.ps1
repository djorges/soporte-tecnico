Get-EventLog -LogName Security -InstanceId 4624 |
Select-Object TimeGenerated, Message |
Export-Csv "C:\Users\jorge\Downloads\login_report.csv" -NoTypeInformation