param (
    [string]$DestinationUser = "cdudi",
    [string[]]$DestinationHosts = @("10.128.0.28"),
    [string]$CsvFilePath = "data4.csv",
    [string]$TargetPath = "/home/cdudi/"
)

foreach ($host in $DestinationHosts) {
    $destination = "${DestinationUser}@${host}:$TargetPath"
    Write-Output "Transferring to $destination"
    scp -o StrictHostKeyChecking=no $CsvFilePath $destination
}
