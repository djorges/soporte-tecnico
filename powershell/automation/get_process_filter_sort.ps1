Get-Process |
Where-Object CPU -gt 100 |
Sort-Object CPU -Descending |
Select-Object Name, CPU, Id