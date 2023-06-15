/*
** ----------------------------------------------------------------------------
** Parameters
** https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/parameters
** ----------------------------------------------------------------------------
*/

@allowed([
  'Development'
  'Production'
])
@description('The name of the environment. This must be Development or Production.')
param environmentName string

@description('The Azure region into which the resources should be deployed.')
param location string

/*
** ----------------------------------------------------------------------------
** Variables
** https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/variables
** ----------------------------------------------------------------------------
*/


/*
** ----------------------------------------------------------------------------
** Resources
** https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/resource-declaration
** ----------------------------------------------------------------------------
*/


/*
** ----------------------------------------------------------------------------
** Outputs
** https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/outputs
** ----------------------------------------------------------------------------
*/
