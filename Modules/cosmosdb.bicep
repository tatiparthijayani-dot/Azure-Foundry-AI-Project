param location string
param environment string

resource cosmos 'Microsoft.DocumentDB/databaseAccounts@2023-09-15' = {
  name: 'cosmos-${environment}'
  location: location

  kind: 'GlobalDocumentDB'

  properties: {
    publicNetworkAccess: 'Disabled'

    databaseAccountOfferType: 'Standard'
  }
}

output cosmosId string = cosmos.id
