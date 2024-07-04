 function host_name {
 #uptime

$OS = Get-WmiObject win32_operatingsystem
$Uptime = (Get-Date) - ($OS.ConvertToDateTime($OS.lastbootuptime))
$Uptime = "" + $Uptime.Days + " days, " + $Uptime.Hours + " hours, " + $Uptime.Minutes + " minutes" 

 # Hostname
$hostname = hostname

# Netzwerkkonfigurationen (IPv4)
$networkConfigs = Get-NetIPConfiguration | Where-Object { $_.IPv4Address -ne $null }

# Output-Dateipfad
$outputFilePath = "C:\temp\SPEC_$hostname.txt"

# Output-Array
$output = @()
$output += "Uptime: $uptime"
$output += "Hostname: $hostname"
$output += ""

foreach ($config in $networkConfigs) {
    $output += "Interface Alias: $($config.InterfaceAlias)"
    foreach ($ip in $config.IPv4Address) {
        $output += "  IP-Adresse: $($ip.IPAddress)"
        $output += "  Subnetzmaske: $($ip.PrefixLength)"
    }
    $output += "  Gateway: $($config.IPv4DefaultGateway.NextHop)"
    $output += ""
}

# Schreiben der Ausgabe in die Datei
$output | Out-File -FilePath $outputFilePath

# Bestätigungsausgabe
Write-Output "Die Netzwerkinformationen wurden in der Datei $outputFilePath gespeichert."

 }

 host_name