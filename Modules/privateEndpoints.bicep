param location string
param subnetId string
param targetResourceId string
param peName string
param groupId string

resource pe 'Microsoft.Network/privateEndpoints@2023-09-01' = {
  name: peName
  location: location

  properties: {
    subnet: {
      id: subnetId
    }

    privateLinkServiceConnections: [
      {
        name: '${peName}-connection'

        properties: {
          privateLinkServiceId: targetResourceId
          groupIds: [
            groupId
          ]
        }
      }
    ]
  }
}