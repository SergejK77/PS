# Alle AppX-Pakete erhalten
$appxPackages = Get-AppxPackage

# Filtern der Pakete, die "xbox" im Namen haben
$xboxPackages = $appxPackages | Where-Object { $_.Name -like "*xbox*" }

# Entfernen der gefilterten Pakete
$xboxPackages | ForEach-Object { Remove-AppxPackage -Package $_.PackageFullName }