param keyVaultName string = 'myKeyVault'
param storageAccountName string = 'mystorageacct'
param keyName string = 'myKey'

module keyVault './keyvault.bicep' = {
  name: 'deployKeyVault'
  params: {
    keyVaultName: keyVaultName
  }
}

module key './keyvaultKey.bicep' = {
  name: 'deployKey'
  params: {
    keyVaultName: keyVaultName
    keyName: keyName
  }
}

module storageAccount './storageAccount.bicep' = {
  name: 'deployStorageAccount'
  params: {
    storageAccountName: storageAccountName
    keyVaultUri: key.outputs.keyUri
  }
}
