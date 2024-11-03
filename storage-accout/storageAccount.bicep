param storageAccountName string
param location string = resourceGroup().location
param keyVaultUri string  // URI de la clé CMK à utiliser pour le chiffrement

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    encryption: {
      services: {
        blob: {
          enabled: true
        }
        file: {
          enabled: true
        }
      }
      keySource: 'Microsoft.Keyvault'
      keyvaultproperties: {
        keyname: 'myKey'
        keyvaulturi: keyVaultUri
      }
    }
  }
}

output storageAccountId string = storageAccount.id
