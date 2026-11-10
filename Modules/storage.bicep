param location string
param environment string

resource storage 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: 'st${uniqueString(resourceGroup().id)}'
  location: location
  sku: {
    name: 'Standard_LRS'
  }

  kind: 'StorageV2'

  properties: {
    publicNetworkAccess: 'Disabled'

    minimumTlsVersion: 'TLS1_2'
  }
}

output storageId string = storage.id