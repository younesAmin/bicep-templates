# Paramètres
$resourceGroupName = "myResourceGroup"
$location = "EastUS"
$keyVaultName = "myKeyVault"
$storageAccountName = "mystorageacct"
$keyName = "myKey"

# Connexion à Azure (assurez-vous d'être authentifié)
Connect-AzAccount

# Créer le groupe de ressources s'il n'existe pas déjà
$rg = Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
if (-not $rg) {
    New-AzResourceGroup -Name $resourceGroupName -Location $location
}

New-AzResourceGroupDeployment -Confirm  -TemplateFile "main.bicep"  -ResourceGroupName $resourceGroupName ` 
    -Name "deploy1" -keyVaultName $keyVaultName -storageAccountName $storageAccountName -keyName $keyName