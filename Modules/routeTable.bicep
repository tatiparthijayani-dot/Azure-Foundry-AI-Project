param location string

resource routeTable 'Microsoft.Network/routeTables@2023-09-01' = {
  name: 'rt-foundry'
  location: location

  properties: {
    routes: [
      {
        name: 'DefaultToFirewall'

        properties: {
          addressPrefix: '0.0.0.0/0'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: '10.100.10.4'
        }
      }
    ]
  }
}