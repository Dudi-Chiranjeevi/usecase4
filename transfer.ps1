# transfer.ps1
param (
    [string]$DestinationUser,
    [string]$DestinationHost",
    [string]$CsvFilePath",
    [string]$TargetPath"
)

# Compose destination string with proper variable expansion
$destination = "${DestinationUser}@${DestinationHost}:$TargetPath"

# Run scp command with strict host key checking disabled
scp -o StrictHostKeyChecking=no $CsvFilePath $destination
