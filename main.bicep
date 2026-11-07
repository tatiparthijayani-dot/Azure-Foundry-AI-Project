targetScope = 'resourceGroup'

@description('Location')
param location string = resourceGroup().location

@description('Environment')
param environment string

@description('VNet Name')
param vnetName string

@description('Address Space')
param addressSpace string

module vnet './modules/vnet.bicep' = {
  name: 'vnetDeployment'
  params: {
    location: location
    vnetName: vnetName
    addressSpace: addressSpace
  }
}

module storage './modules/storage.bicep' = {
  name: 'storageDeployment'
  params: {
    location: location
    environment: environment
  }
}

module search './modules/aiSearch.bicep' = {
  name: 'searchDeployment'
  params: {
    location: location
    environment: environment
  }
}

module cosmos './modules/cosmosdb.bicep' = {
  name: 'cosmosDeployment'
  params: {
    location: location
    environment: environment
  }
}

module foundry './modules/foundry.bicep' = {
  name: 'foundryDeployment'
  params: {
    location: location
    environment: environment
    agentSubnetId: vnet.outputs.agentSubnetId
  }
}
