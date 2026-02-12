Get-Process | Format-Table  
@{Label="Proceso"; Expression={$_.Name}},
@{Label="CPU usada"; Expression={$_.CPU}}