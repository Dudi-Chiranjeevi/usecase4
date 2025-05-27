# transfer.ps1
param (
    [string]$DestinationUser = "cdudi",
    [string]$DestinationHost = "10.128.0.28",
    [string]$CsvFilePath = "data4.csv",
    [string]$TargetPath = "/home/cdudi/"
)

# Compose destination string with proper variable expansion
$destination = "${DestinationUser}@${DestinationHost}:$TargetPath"

# Run scp command with strict host key checking disabled
scp -o StrictHostKeyChecking=no $CsvFilePath $destination
