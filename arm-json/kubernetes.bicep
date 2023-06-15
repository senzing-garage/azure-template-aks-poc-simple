param reference_parameters_resourceName_addonProfiles_omsAgent_identity_objectId object

resource mjd_k8s_cluster_Microsoft_Authorization_0cc88c2f_5ba3_45ec_abc8_503b49a4af0d 'Microsoft.ContainerService/managedClusters/providers/roleAssignments@2018-01-01-preview' = {
  name: 'mjd-k8s-cluster/Microsoft.Authorization/0cc88c2f-5ba3-45ec-abc8-503b49a4af0d'
  properties: {
    roleDefinitionId: '/subscriptions/${subscription().subscriptionId}/providers/Microsoft.Authorization/roleDefinitions/3913510d-42f4-4e42-8a64-420c390055eb'
    principalId: reference_parameters_resourceName_addonProfiles_omsAgent_identity_objectId.addonProfiles.omsAgent.identity.objectId
    scope: '/subscriptions/5415bf99-6956-43fd-a8a9-434c958ca13c/resourceGroups/senzing-mjd-rg-002/providers/Microsoft.ContainerService/managedClusters/mjd-k8s-cluster'
  }
}