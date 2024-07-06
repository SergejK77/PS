Disable ipv6

Get-NetAdapter |foreach {Disable-NetAdapterBinding -InterfaceAlias $_.Name -ComponentID ms_tcpip6 }

#Check

Get-NetAdapter | foreach { Get-NetAdapterBinding -InterfaceAlias $_.Name -ComponentID ms_tcpip6 }