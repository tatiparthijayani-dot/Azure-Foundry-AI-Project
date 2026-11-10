param location string
param environment string
param agentSubnetId string

resource appEnv 'Microsoft.App/managedEnvironments@2024-03-01' = {
  name: 'foundry-agent-env-${environment}'
  location: location

  properties: {
    vnetConfiguration: {
      infrastructureSubnetId: agentSubnetId
    }
  }
}