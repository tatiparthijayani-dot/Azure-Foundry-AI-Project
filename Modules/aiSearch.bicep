param location string
param environment string

resource search 'Microsoft.Search/searchServices@2023-11-01' = {
  name: 'aisearch-${environment}'

  location: location

  sku: {
    name: 'standard'
  }

  properties: {
    publicNetworkAccess: 'disabled'
  }
}

output searchId string = search.id