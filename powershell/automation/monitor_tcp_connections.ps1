function Monitor-TCPConnections {
    param([int]$RefreshSeconds = 5)

    while ($true) {
        Clear-Host
        Get-NetTCPConnection |
        Select LocalAddress,LocalPort,RemoteAddress,RemotePort,State |
        Format-Table
        Start-Sleep $RefreshSeconds
    }
}