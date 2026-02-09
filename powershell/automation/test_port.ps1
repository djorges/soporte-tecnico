function Test-PortScan {
    param([string] $HostRemote, [int[]]$Ports)

    foreach ($port in $Ports) {
        $tcp = New-Object Net.Sockets.TcpClient
        try {
            $tcp.Connect($HostRemote, $port)
            Write-Host "Puerto $port abierto"
        } catch {
            Write-Host "Puerto $port cerrado"
        }
        $tcp.Close()
    }
}

Test-PortScan -Host "scanme.nmap.org" -Ports 21,22,23,25,53,80,110,135,139,143,443,445,3389
