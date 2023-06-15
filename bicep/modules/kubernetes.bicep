/*
** ----------------------------------------------------------------------------
** Deploy Kubernetes
**
** Based on
** https://docs.microsoft.com/en-us/azure/templates/microsoft.containerservice/managedclusters?tabs=bicep
** ----------------------------------------------------------------------------
*/


/*
** ----------------------------------------------------------------------------
** Parameters
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
** ----------------------------------------------------------------------------
*/



/*
** ----------------------------------------------------------------------------
** Resources
** ----------------------------------------------------------------------------
*/

resource symbolicname 'Microsoft.ContainerService/managedClusters@2021-05-01' = {
  name: 'string'
  location: 'string'
  tags: {}
  properties: {
    kubernetesVersion: 'string'
    dnsPrefix: 'string'
    fqdnSubdomain: 'string'
    agentPoolProfiles: [
      {
        count: int
        vmSize: 'string'
        osDiskSizeGB: int
        osDiskType: 'string'
        kubeletDiskType: 'string'
        vnetSubnetID: 'string'
        podSubnetID: 'string'
        maxPods: int
        osType: 'string'
        osSKU: 'string'
        maxCount: int
        minCount: int
        enableAutoScaling: bool
        type: 'string'
        mode: 'string'
        orchestratorVersion: 'string'
        upgradeSettings: {
          maxSurge: 'string'
        }
        availabilityZones: [
          'string'
        ]
        enableNodePublicIP: bool
        nodePublicIPPrefixID: 'string'
        scaleSetPriority: 'string'
        scaleSetEvictionPolicy: 'string'
        spotMaxPrice: any('number')
        tags: {}
        nodeLabels: {}
        nodeTaints: [
          'string'
        ]
        proximityPlacementGroupID: 'string'
        kubeletConfig: {
          cpuManagerPolicy: 'string'
          cpuCfsQuota: bool
          cpuCfsQuotaPeriod: 'string'
          imageGcHighThreshold: int
          imageGcLowThreshold: int
          topologyManagerPolicy: 'string'
          allowedUnsafeSysctls: [
            'string'
          ]
          failSwapOn: bool
          containerLogMaxSizeMB: int
          containerLogMaxFiles: int
          podMaxPids: int
        }
        linuxOSConfig: {
          sysctls: {
            netCoreSomaxconn: int
            netCoreNetdevMaxBacklog: int
            netCoreRmemDefault: int
            netCoreRmemMax: int
            netCoreWmemDefault: int
            netCoreWmemMax: int
            netCoreOptmemMax: int
            netIpv4TcpMaxSynBacklog: int
            netIpv4TcpMaxTwBuckets: int
            netIpv4TcpFinTimeout: int
            netIpv4TcpKeepaliveTime: int
            netIpv4TcpKeepaliveProbes: int
            netIpv4TcpkeepaliveIntvl: int
            netIpv4TcpTwReuse: bool
            netIpv4IpLocalPortRange: 'string'
            netIpv4NeighDefaultGcThresh1: int
            netIpv4NeighDefaultGcThresh2: int
            netIpv4NeighDefaultGcThresh3: int
            netNetfilterNfConntrackMax: int
            netNetfilterNfConntrackBuckets: int
            fsInotifyMaxUserWatches: int
            fsFileMax: int
            fsAioMaxNr: int
            fsNrOpen: int
            kernelThreadsMax: int
            vmMaxMapCount: int
            vmSwappiness: int
            vmVfsCachePressure: int
          }
          transparentHugePageEnabled: 'string'
          transparentHugePageDefrag: 'string'
          swapFileSizeMB: int
        }
        enableEncryptionAtHost: bool
        enableUltraSSD: bool
        enableFIPS: bool
        gpuInstanceProfile: 'string'
        name: 'string'
      }
    ]
    linuxProfile: {
      adminUsername: 'string'
      ssh: {
        publicKeys: [
          {
            keyData: 'string'
          }
        ]
      }
    }
    windowsProfile: {
      adminUsername: 'string'
      adminPassword: 'string'
      licenseType: 'string'
      enableCSIProxy: bool
    }
    servicePrincipalProfile: {
      clientId: 'string'
      secret: 'string'
    }
    addonProfiles: {
      config: {}
      enabled: bool
    }
    podIdentityProfile: {
      enabled: bool
      allowNetworkPluginKubenet: bool
      userAssignedIdentities: [
        {
          name: 'string'
          namespace: 'string'
          bindingSelector: 'string'
          identity: {
            resourceId: 'string'
            clientId: 'string'
            objectId: 'string'
          }
        }
      ]
      userAssignedIdentityExceptions: [
        {
          name: 'string'
          namespace: 'string'
          podLabels: {}
        }
      ]
    }
    nodeResourceGroup: 'string'
    enableRBAC: bool
    enablePodSecurityPolicy: bool
    networkProfile: {
      networkPlugin: 'string'
      networkPolicy: 'string'
      networkMode: 'string'
      podCidr: 'string'
      serviceCidr: 'string'
      dnsServiceIP: 'string'
      dockerBridgeCidr: 'string'
      outboundType: 'string'
      loadBalancerSku: 'string'
      loadBalancerProfile: {
        managedOutboundIPs: {
          count: int
        }
        outboundIPPrefixes: {
          publicIPPrefixes: [
            {
              id: 'string'
            }
          ]
        }
        outboundIPs: {
          publicIPs: [
            {
              id: 'string'
            }
          ]
        }
        effectiveOutboundIPs: [
          {
            id: 'string'
          }
        ]
        allocatedOutboundPorts: int
        idleTimeoutInMinutes: int
      }
    }
    aadProfile: {
      managed: bool
      enableAzureRBAC: bool
      adminGroupObjectIDs: [
        'string'
      ]
      clientAppID: 'string'
      serverAppID: 'string'
      serverAppSecret: 'string'
      tenantID: 'string'
    }
    autoUpgradeProfile: {
      upgradeChannel: 'string'
    }
    autoScalerProfile: {
      balance-similar-node-groups: 'string'
      expander: 'string'
      max-empty-bulk-delete: 'string'
      max-graceful-termination-sec: 'string'
      max-node-provision-time: 'string'
      max-total-unready-percentage: 'string'
      new-pod-scale-up-delay: 'string'
      ok-total-unready-count: 'string'
      scan-interval: 'string'
      scale-down-delay-after-add: 'string'
      scale-down-delay-after-delete: 'string'
      scale-down-delay-after-failure: 'string'
      scale-down-unneeded-time: 'string'
      scale-down-unready-time: 'string'
      scale-down-utilization-threshold: 'string'
      skip-nodes-with-local-storage: 'string'
      skip-nodes-with-system-pods: 'string'
    }
    apiServerAccessProfile: {
      authorizedIPRanges: [
        'string'
      ]
      enablePrivateCluster: bool
      privateDNSZone: 'string'
      enablePrivateClusterPublicFQDN: bool
    }
    diskEncryptionSetID: 'string'
    identityProfile: {}
    privateLinkResources: [
      {
        id: 'string'
        name: 'string'
        type: 'string'
        groupId: 'string'
        requiredMembers: [
          'string'
        ]
      }
    ]
    disableLocalAccounts: bool
    httpProxyConfig: {
      httpProxy: 'string'
      httpsProxy: 'string'
      noProxy: [
        'string'
      ]
      trustedCa: 'string'
    }
  }
  identity: {
    type: 'string'
    userAssignedIdentities: {}
  }
  sku: {
    name: 'Basic'
    tier: 'string'
  }
  extendedLocation: {
    name: 'string'
    type: 'EdgeZone'
  }
  resources: []
}

/*
** ----------------------------------------------------------------------------
** Outputs
** ----------------------------------------------------------------------------
*/
