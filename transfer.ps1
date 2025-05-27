# transfer.ps1
# param (
#     [string]$DestinationUser = "cdudi",
#     [string]$DestinationHost = "10.128.0.28",
#     [string]$CsvFilePath = "data4.csv",
#     [string]$TargetPath = "/home/cdudi/"
# )

# # Compose destination string with proper variable expansion
# $destination = "${DestinationUser}@${DestinationHost}:$TargetPath"

# # Run scp command with strict host key checking disabled
# scp -o StrictHostKeyChecking=no $CsvFilePath $destination

param (
    [string]$DestinationUser,
    [string[]]$DestinationHosts,
    [string]$CsvFilePath,
    [string]$TargetPath
)

foreach ($DestinationHost in $DestinationHosts) {
    $destination = "${DestinationUser}@${DestinationHost}:$TargetPath"
    Write-Output "`nTransferring $CsvFilePath to $destination"

    try {
        $scpCommand = "scp -o StrictHostKeyChecking=no $CsvFilePath $destination"
        Write-Output "Running: $scpCommand"
        Invoke-Expression $scpCommand

        if ($LASTEXITCODE -eq 0) {
            Write-Output "✅ Transfer to $DestinationHost successful."
        } else {
            Write-Error "❌ Transfer to $DestinationHost failed with exit code $LASTEXITCODE"
        }
    } catch {
        Write-Error "❌ Exception during transfer to $DestinationHost: $_"
    }
}
