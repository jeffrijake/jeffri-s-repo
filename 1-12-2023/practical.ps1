# # Install and import the Azure PowerShell module
# Install-Module -Name Az -Force -AllowClobber -Scope CurrentUser
# Import-Module Az -Force

# Sign in to your Azure account
Connect-AzAccount -tenantid "e6ab23cc-256c-4a8f-b1b9-ccaebe0ee93e"

# Set Subscription context
Set-AzContext -subscriptionId "f032a5a1-859b-458d-b9a8-9b6b70f9613e"

# Specify your Azure Storage Account details
$storageAccountName = "jeffristorage"
$resourceGroupName = "jeffri_new_resourcegroup"

# Get the storage account context
$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -AccountName $storageAccountName
$ctx = $storageAccount.Context

# List and delete blobs in all containers
$containers = Get-AzStorageContainer -Context $ctx
foreach ($container in $containers) {
    $blobs = Get-AzStorageBlob -Context $ctx -Container $container.Name
    foreach ($blob in $blobs) {
        Remove-AzStorageBlob -Context $ctx -Container $container.Name -Blob $blob.Name -Force
        Write-Output "Deleted blob: $($blob.Name)"
    }
}

# List and delete tables
$tables = Get-AzStorageTable -Context $ctx
foreach ($table in $tables) {
    Remove-AzStorageTable -Context $ctx -Name $table.Name 
    Write-Output "Deleted table: $($table.Name)"
}

# List and delete files in all file shares
$fileShares = Get-AzStorageShare -Context $ctx
foreach ($fileShare in $fileShares) {
    $files = Get-AzStorageFile -Context $ctx -ShareName $fileShare.Name
    foreach ($file in $files) {
        Remove-AzStorageFile -Context $ctx -ShareName $fileShare.Name -Path $file.Name 
        Write-Output "Deleted file: $($file.Name)"
    }
}

#Write-Output "All blobs, tables, and files in the storage account have been deleted."

