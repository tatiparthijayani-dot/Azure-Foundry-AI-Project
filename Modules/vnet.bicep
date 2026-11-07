param location string
param vnetName string
param addressSpace string

resource vnet 'Microsoft.Network/virtualNetworks@2023-09-01' = {
  name: vnetName
  location: location

  properties: {
    addressSpace: {
      addressPrefixes: [
        addressSpace
      ]
    }

    subnets: [
      {
        name: 'AppSubnet'
        properties: {
          addressPrefix: '10.100.1.0/24'
        }
      }
      {
        name: 'DataSubnet'
        properties: {
          addressPrefix: '10.100.2.0/24'
        }
      }
      {
        name: 'PrivateEndpointSubnet'
        properties: {
          addressPrefix: '10.100.3.0/24'
          privateEndpointNetworkPolicies: 'Disabled'
        }
      }
      {
        name: 'AgentSubnet'
        properties: {
          addressPrefix: '10.100.4.0/24'

          delegations: [
            {
              name: 'foundryDelegation'
              properties: {
                serviceName: 'Microsoft.App/environments'
              }
            }
          ]
        }
      }
    ]
  }
}

output agentSubnetId string = resourceId(
  'Microsoft.Network/virtualNetworks/subnets',
  vnet.name,
  'AgentSubnet'
)
