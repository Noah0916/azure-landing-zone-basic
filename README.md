# Azure Landing Zone – Basic

Dit project is een eenvoudige Azure Landing Zone voor een single-subscription omgeving.
Het is bedoeld als portfolio-project voor een toekomstige Cloud Engineer / Cloud Architect.

## Doelen

- Resource groups structureren (platform vs application)
- Basis governance met tags en naming conventies
- Infra as Code met Bicep
- Documentatie + architectuurdiagram

## Architectuur-overzicht

- **Subscription**
  - **rg-platform** (netwerk, shared resources)
  - **rg-app** (applicatie workloads)

Alle resources krijgen standaard tags:

- `environment = dev`
- `owner = willeke` (pas aan naar je eigen naam)
- `costCenter = demo`

## Tech stack

- Azure (conceptueel)
- Bicep (Infrastructure as Code)
- GitHub voor versiebeheer

## Gebruik

> Dit project is vooral bedoeld als architectuur-voorbeeld.
> Deployment is optioneel. Als je wél wilt deployen:

1. Login in Azure CLI:
   ```bash
   az login
