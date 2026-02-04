Get-NetTCPConnection -RemotePort 443 |
Select-Object RemoteAddress |
ForEach-Object {
    #try to resolve the remote address to a hostname via DNS
    try {
        [System.Net.Dns]::GetHostEntry($_.RemoteAddress).HostName
    } catch {
        $_.RemoteAddress
    }
}