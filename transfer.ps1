# transfer.ps1
param (
    [string]$DestinationUser = "your-vm2-username",
    [string]$DestinationHost = "vm2-external-ip",
    [string]$CsvFilePath = "data.csv",
    [string]$TargetPath = "/home/your-vm2-username/"
)

# Transfer the CSV file using SCP
scp -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no $CsvFilePath "$DestinationUser@$DestinationHost:$TargetPath"