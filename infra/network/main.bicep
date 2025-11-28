@description('Location for all network resources')
param location string = 'westeurope'

@description('Environment name (dev, test, prod)')
param environment string = 'dev'

@description('Virtual network CIDR')
param vnetAddressPrefix string = '10.0.0.0/16'

@description('Subnet prefixes')
param subnetPrefixes array = [
  '10.0.1.0/24' // subnet1
  '10.0.2.0/24' // subnet2
  '10.0.3.0/24' // subnet3
]

resource vnet 'Microsoft.Network/virtualNetworks@2023-09-01' = {
  name: 'vnet-${environment}'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      for (prefix, i) in subnetPrefixes: {
        name: 'subnet${i + 1}'
        properties: {
          addressPrefix: prefix
        }
      }
    ]
  }
}

output vnetName string = vnet.name
output subnetNames array = [for s in vnet.properties.subnets: s.name]
