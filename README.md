# azure-template-aks-poc-simple
An Azure ARM template for bringing up Senzing on Kubernetes (AKS)

## Under construction

### In development branch

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FSenzing%2Fazure-template-aks-poc-simple%2Fissue-3.dockter.1%2Farm-json%2Faks-poc-simple.json)

### In main branch

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FSenzing%2Fazure-template-aks-poc-simple%2Fmain%2Fmain.json)1.


## Development

### Clone repository

The Git repository has files that will be used in the `helm install --values` parameter.

1. Using these environment variable values:

    ```console
    export GIT_ACCOUNT=senzing
    export GIT_REPOSITORY=kubernetes-demo
    export GIT_ACCOUNT_DIR=~/${GIT_ACCOUNT}.git
    export GIT_REPOSITORY_DIR="${GIT_ACCOUNT_DIR}/${GIT_REPOSITORY}"
    ```

1. Follow steps in [clone-repository](https://github.com/Senzing/knowledge-base/blob/master/HOWTO/clone-repository.md) to install the Git repository.

1. XXX
   Example

    ```
    cd ${GIT_REPOSITORY_DIR}
    bicep build  main.bicep --outfile main.json
    ```
