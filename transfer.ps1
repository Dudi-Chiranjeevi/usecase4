# # transfer.ps1
# # param (
# #     [string]$DestinationUser = "cdudi",
# #     [string]$DestinationHost = "10.128.0.28",
# #     [string]$CsvFilePath = "data4.csv",
# #     [string]$TargetPath = "/home/cdudi/"
# # )

# # # Compose destination string with proper variable expansion
# # $destination = "${DestinationUser}@${DestinationHost}:$TargetPath"

# # # Run scp command with strict host key checking disabled
# # scp -o StrictHostKeyChecking=no $CsvFilePath $destination

# param (
#     [string]$DestinationUser,
#     [string[]]$DestinationHosts,
#     [string]$CsvFilePath,
#     [string]$TargetPath
# )

# foreach ($DestinationHost in $DestinationHosts) {
#     $destination = "${DestinationUser}@${DestinationHost}:$TargetPath"
#     Write-Output "`nTransferring $CsvFilePath to $destination"

#     try {
#         $scpCommand = "scp -o StrictHostKeyChecking=no $CsvFilePath $destination"
#         Write-Output "Running: $scpCommand"
#         Invoke-Expression $scpCommand

#         if ($LASTEXITCODE -eq 0) {
#             Write-Output "✅ Transfer to $DestinationHost successful."
#         } else {
#             Write-Error "❌ Transfer to $DestinationHost failed with exit code $LASTEXITCODE"
#         }
#     } catch {
#         Write-Error "❌ Exception during transfer to $DestinationHost: $_"
#     }
# }


# transfer.ps1
# param (
#     [string]$DestinationUser = "cdudi",
#     [string]$DestinationHost = "10.128.0.24",
#     [string]$CsvFilePath = "data4.csv",
#     [string]$TargetPath = "/home/cdudi/"
# )

# # Compose destination string with proper variable expansion
# $destination = "${DestinationUser}@${DestinationHost}:$TargetPath"

# # Run scp command with strict host key checking disabled
# scp -o StrictHostKeyChecking=no $CsvFilePath $destination

# param (
#     [string]$DestinationUser = "cdudi",
#     [string[]]$DestinationHosts = @("10.128.0.24", "10.128.0.28"),
#     [string]$CsvFilePath = "data4.csv",
#     [string]$TargetPath = "/home/cdudi/",
#     [int]$MaxRetries = 1  # Only 1 retry after initial attempt
# )
 
# function Transfer-WithRetry {
#     param (
#         [string[]]$Hosts
#     )
 
#     $failedHosts = @{}
#     $jobs = @{}
 
#     foreach ($host in $Hosts) {
#         $jobs[$host] = Start-Job -ScriptBlock {
#             param ($csv, $destUser, $hostIp, $path)
#             $destination = "$destUser@$hostIp:$path"
#             scp -o StrictHostKeyChecking=no $csv $destination
#         } -ArgumentList $CsvFilePath, $DestinationUser, $host, $TargetPath
#     }
 
#     foreach ($host in $jobs.Keys) {
#         $job = $jobs[$host]
#         Wait-Job $job
 
#         if ($job.State -eq 'Completed') {
#             try {
#                 Receive-Job $job -ErrorAction Stop | Out-Null
#                 Write-Host "✅ Transfer succeeded: $host"
#             } catch {
#                 Write-Host "❌ Transfer failed: $host"
#                 $failedHosts[$host] = $true
#             }
#         } else {
#             Write-Host "❌ Transfer job failed or timed out: $host"
#             $failedHosts[$host] = $true
#         }
 
#         Remove-Job $job
#     }
 
#     return $failedHosts.Keys
# }
 
# $retry = 0
# $remainingHosts = $DestinationHosts
 
# do {
#     Write-Host "🔁 Attempt #$($retry + 1) for $($remainingHosts.Count) host(s)"
#     $failed = Transfer-WithRetry -Hosts $remainingHosts
#     $retry++
#     $remainingHosts = $failed
# } while ($remainingHosts.Count -gt 0 -and $retry -le $MaxRetries)
 
# if ($remainingHosts.Count -gt 0) {
#     Write-Host "`n❌ Final failures on: $($remainingHosts -join ', ')"
#     exit 1
# } else {
#     Write-Host "`n✅ All transfers completed successfully."
# }

param (
    [string]$DestinationUser,
    [string]$DestinationHosts,
    [string]$CsvFilePath,
    [string]$TargetPath,
    [int]$MaxRetries = 1
)

# Convert comma-separated host string into an array
$hosts = $DestinationHosts -split ','

foreach ($hostIp in $hosts) {
    $retryCount = 0
    $success = $false

    while (-not $success -and $retryCount -lt $MaxRetries) {
        try {
            $destination = "$DestinationUser@${hostIp}:${TargetPath}"
            Write-Host "Transferring $CsvFilePath to $destination"
            
            # Replace this with actual transfer command
            # Example: scp $CsvFilePath "$destination"
            # Simulating transfer with echo
            Write-Host "scp $CsvFilePath $destination"

            $success = $true
        } catch {
            Write-Host "Transfer to $hostIp failed. Retry #$($retryCount + 1)"
            $retryCount++
            Start-Sleep -Seconds 2
        }
    }

    if (-not $success) {
        Write-Host "Transfer to $hostIp failed after $MaxRetries retries."
        exit 1
    }
}
