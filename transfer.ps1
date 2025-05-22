# transfer.ps1
param (
    [string]$DestinationUser = "cdudi",
    [string]$DestinationHost = "35.225.255.73",
    [string]$CsvFilePath = "data.csv",
    [string]$TargetPath = "/home/cdudi/"
)

# Compose destination string with proper variable expansion
$destination = "${DestinationUser}@${DestinationHost}:$TargetPath"

# Run scp command with strict host key checking disabled
scp -o StrictHostKeyChecking=no $CsvFilePath $destination
