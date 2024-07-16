# MMA Agent Removal

This policy will remove the MMA agent from a machine if it has been installed as a VM extension.

## How it works

Identify machines which have the agent installed and tag them with ```MMA_Installed:true```. This will force the policy to deploy a deployment script resource which will execute and remove the extension using the script in ```removal.ps1```. The tag will then be removed from the machine as well.

## Pre-requisites

- A user assigned managed identity with Contributor rights (assigned at management group level) - this is used to create the deployment scripts. There is also a custom role you can create to limit this identities privileges - https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/deployment-script-template#configure-the-minimum-permissions
- Subscriptions need the Microsoft.ContainerInstance resource provider registered.

## Deployment

- Create a new policy and add the contents of ```policyRule.json```
- Assign the policy to a testing scope
- Use a remediation task to fix any non-compliant resources

## Caveats

- Will only work in regions where Azure Container Instances is available. 