
@description('Naam van de omgeving (bijv. dev, test, prod)')
param environment string = 'dev'

@description('Owner / verantwoordelijke persoon')
param ownerName string = 'willeke'

@description('Cost center of project code')
param costCenter string = 'demo'

@description('Azure regio voor resource groups')
param location string = 'westeurope'

// Standaard tags voor alle resource groups
var defaultTags = {
  environment: environment
  owner: ownerName
  costCenter: costCenter
}

// Resource group voor platform-componenten
resource rgPlatform 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-platform-${environment}'
  location: location
  tags: defaultTags
}

// Resource group voor applicatie workloads
resource rgApp 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-app-${environment}'
  location: location
  tags: defaultTags
}

// Outputs voor documentatie en verificatie
output platformRgName string = rgPlatform.name
output appRgName string = rgApp.name
output deploymentLocation string = location

