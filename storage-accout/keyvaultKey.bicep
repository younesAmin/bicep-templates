param keyVaultName string
param keyName string

resource keyVault 'Microsoft.KeyVault/vaults@2022-07-01' existing = {
  name: keyVaultName
}

resource key 'Microsoft.KeyVault/vaults/keys@2022-07-01' = {
  parent: keyVault // resourceId("Microsoft.KeyVault/vaults@2022-07-01", keyVaultName)
  name: keyName
  properties: {
    kty: 'RSA'
    keySize: 2048
  }
}

output keyUri string = key.properties.keyUri
