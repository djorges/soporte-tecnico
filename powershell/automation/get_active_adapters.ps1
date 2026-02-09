function Get-ActiveAdapters {
    Get-NetAdapter |
    Where-Object { $_.Status -eq "Up" } |
    Select-Object Name, InterfaceDescription, LinkSpeed, MacAddress |
    Format-Table
}

Get-ActiveAdapters