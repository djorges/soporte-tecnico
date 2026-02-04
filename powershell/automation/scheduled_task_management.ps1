$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-File C:\Users\jorge\Downloads\HelloWorld.ps1"
$trigger = New-ScheduledTaskTrigger -Weekly -At "10:00AM"

Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "WeeklyHelloScriptTask" -User "jorge"