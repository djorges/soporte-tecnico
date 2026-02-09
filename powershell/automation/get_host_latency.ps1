function Measure-Latency {
    param([string]$HostRemote)

    $result = Test-Connection $HostRemote -Count 4
    $avg = ($result | Measure-Object -Property ResponseTime -Average).Average

    Write-Output "Latencia promedio a $HostRemote : $([math]::Round($avg,2)) ms"
}

Measure-Latency -Host "google.com"