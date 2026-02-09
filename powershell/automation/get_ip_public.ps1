function Get-PublicIP {
    try {
        $ip = Invoke-RestMethod "https://api.ipify.org?format=json"
        Write-Output "IP Pública: $($ip.ip)"
    }
    catch {
        Write-Output "No se pudo obtener la IP pública"
    }
}

Get-PublicIP