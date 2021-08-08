# Microsoft Quickstart

Set up an Azure Kubernetes Service (AKS) and Azure Container Registry (ACR).
Create a Docker image in the ACR and deploy to AKS using Helm.

Full tutorial at
[Quickstart: Develop on Azure Kubernetes Service (AKS) with Helm](https://docs.microsoft.com/en-us/azure/aks/quickstart-helm).

## Prerequisites

1. See tutorial [Prerequisites](https://docs.microsoft.com/en-us/azure/aks/quickstart-helm#prerequisites).

1. Login to Azure.
   Example:

    ```console
    az login
    ```

1. :thinking: If `kubectl` is not installed, install `kubectl`
   using
   [az aks install-cli](https://docs.microsoft.com/en-us/cli/azure/aks?view=azure-cli-latest#az_aks_install_cli)
   Example:

    ```console
    az aks install-cli
    ```

1. :pencil2: Create unique prefix.
   This will be used to create unique names in Azure.
   Example:

    ```console
    export MY_PREFIX=Xyzzy
    ```

1. Set environment variables using unique prefix.
   Example:

    ```console
    export AZ_RESOURCE_GROUP_NAME="${MY_PREFIX}ResourceGroup"
    export AZ_LOCATION=eastus
    export AZ_ACR_NAME="${MY_PREFIX}Acr"
    export AZ_AKS_NAME="${MY_PREFIX}Aks"
    ```

## Create a Resource Group

1. Create Resource group
   using
   [az group create](https://docs.microsoft.com/en-us/cli/azure/group?view=azure-cli-latest#az_group_create).
   Example:

    ```console
    az group create \
        --name ${AZ_RESOURCE_GROUP_NAME} \
        --location ${AZ_LOCATION}
    ```

## Create an Azure Container Registry

1. [Create an Azure Container Registry](https://docs.microsoft.com/en-us/azure/aks/quickstart-helm#create-an-azure-container-registry)
   using
   [az acr create](https://docs.microsoft.com/en-us/cli/azure/acr?view=azure-cli-latest#az_acr_create).
   Example:

    ```console
    az acr create \
        --resource-group ${AZ_RESOURCE_GROUP_NAME} \
        --name ${AZ_ACR_NAME} \
        --sku Basic
    ```

## Create an AKS cluster

1. [Create Azure Kubernetes Service (AKS)](https://docs.microsoft.com/en-us/azure/aks/quickstart-helm#create-an-aks-cluster)
   using
   [az aks create](https://docs.microsoft.com/en-us/cli/azure/aks?view=azure-cli-latest#az_aks_create)
   Example:

    ```console
    az aks create \
        --resource-group ${AZ_RESOURCE_GROUP_NAME} \
        --name ${AZ_AKS_NAME} \
        --location ${AZ_LOCATION} \
        --attach-acr ${AZ_ACR_NAME} \
        --generate-ssh-keys
    ```

## Connect to your AKS cluster

1. [Connect to your AKS cluster](https://docs.microsoft.com/en-us/azure/aks/quickstart-helm#connect-to-your-aks-cluster).
   Get credentials for `kubectl` using
   [az aks get-credential](https://docs.microsoft.com/en-us/cli/azure/aks?view=azure-cli-latest#az_aks_get_credentials)
   Example:

    ```console
    az aks get-credentials \
        --resource-group ${AZ_RESOURCE_GROUP_NAME} \
        --name ${AZ_AKS_NAME}
    ```

## Download the sample application

1. [Download sample application](https://docs.microsoft.com/en-us/azure/aks/quickstart-helm#download-the-sample-application)
   using
   [git clone](https://git-scm.com/docs/git-clone).
   Example:

    ```console
    mkdir ~/misc.git
    cd ~/misc.git
    git clone https://github.com/Azure-Samples/azure-voting-app-redis.git
    ```

## Build and push the sample application to the ACR

1. [Build and push the sample application to the ACR](https://docs.microsoft.com/en-us/azure/aks/quickstart-helm#build-and-push-the-sample-application-to-the-acr)
   using
   [az acr build](https://docs.microsoft.com/en-us/cli/azure/acr?view=azure-cli-latest#az_acr_build).
   Example:

    ```console
    cd ~/misc.git/azure-voting-app-redis/azure-vote/

    az acr build \
        --image azure-vote-front:v1 \
        --registry ${AZ_ACR_NAME} \
        --file Dockerfile \
        .
    ```

## Create your Helm chart

1. [Create your Helm chart](https://docs.microsoft.com/en-us/azure/aks/quickstart-helm#create-your-helm-chart)

    1. Use
       [helm create](https://helm.sh/docs/helm/helm_create/)
       Example:

        ```console
        cd ~/misc.git/azure-voting-app-redis
        helm create azure-vote-front
        ```

    1. Modify `Chart.yaml`.
       Example:

        ```console
        cat > ~/misc.git/azure-voting-app-redis/azure-vote-front/Chart.yaml <<EOF
        apiVersion: v2
        name: azure-vote-front
        description: A Helm chart for Kubernetes
        type: application
        version: 0.1.0
        appVersion: v1

        dependencies:
          - name: redis
            version: 14.7.1
            repository: https://charts.bitnami.com/bitnami

        EOF
        ```

    1. Update helm dependencies
       using
       [helm dependency update](https://helm.sh/docs/helm/helm_dependency_update/)
       Example:

        ```console
        cd ~/misc.git/azure-voting-app-redis
        helm dependency update azure-vote-front
        ```

    1. Modify `values.yaml`.
       Example:

        ```console
        cat > ~/misc.git/azure-voting-app-redis/azure-vote-front/values.yaml <<EOF
        replicaCount: 1
        backendName: azure-vote-backend-master

        redis:
          image:
            registry: mcr.microsoft.com
            repository: oss/bitnami/redis
            tag: 6.0.8
          fullnameOverride: azure-vote-backend
          auth:
            enabled: false

        image:
          repository: ${AZ_ACR_NAME}.azurecr.io/azure-vote-front
          pullPolicy: IfNotPresent
          tag: "v1"

        imagePullSecrets: []
        nameOverride: ""
        fullnameOverride: ""

        serviceAccount:
          create: true
          annotations: {}
          name: ""

        podAnnotations: {}

        podSecurityContext: {}

        securityContext: {}

        service:
          type: LoadBalancer
          port: 80

        ingress:
          enabled: false
          className: ""
          annotations: {}
          hosts:
            - host: chart-example.local
              paths:
                - path: /
                  pathType: ImplementationSpecific
          tls: []

        resources: {}

        autoscaling:
          enabled: false
          minReplicas: 1
          maxReplicas: 100
          targetCPUUtilizationPercentage: 80

        nodeSelector: {}

        tolerations: []

        affinity: {}

        EOF
        ```

    1. Modify `deployment.yaml`.
       Example:

        ```console
        cat > ~/misc.git/azure-voting-app-redis/azure-vote-front/templates/deployment.yaml <<EOF
        apiVersion: apps/v1
        kind: Deployment
        metadata:
          name: {{ include "azure-vote-front.fullname" . }}
          labels:
            {{- include "azure-vote-front.labels" . | nindent 4 }}
        spec:
          {{- if not .Values.autoscaling.enabled }}
          replicas: {{ .Values.replicaCount }}
          {{- end }}
          selector:
            matchLabels:
              {{- include "azure-vote-front.selectorLabels" . | nindent 6 }}
          template:
            metadata:
              {{- with .Values.podAnnotations }}
              annotations:
                {{- toYaml . | nindent 8 }}
              {{- end }}
              labels:
                {{- include "azure-vote-front.selectorLabels" . | nindent 8 }}
            spec:
              {{- with .Values.imagePullSecrets }}
              imagePullSecrets:
                {{- toYaml . | nindent 8 }}
              {{- end }}
              serviceAccountName: {{ include "azure-vote-front.serviceAccountName" . }}
              securityContext:
                {{- toYaml .Values.podSecurityContext | nindent 8 }}
              containers:
                - name: {{ .Chart.Name }}
                  env:
                  - name: REDIS
                    value: {{ .Values.backendName }}
                  securityContext:
                    {{- toYaml .Values.securityContext | nindent 12 }}
                  image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
                  imagePullPolicy: {{ .Values.image.pullPolicy }}
                  ports:
                    - name: http
                      containerPort: 80
                      protocol: TCP
                  livenessProbe:
                    httpGet:
                      path: /
                      port: http
                  readinessProbe:
                    httpGet:
                      path: /
                      port: http
                  resources:
                    {{- toYaml .Values.resources | nindent 12 }}
              {{- with .Values.nodeSelector }}
              nodeSelector:
                {{- toYaml . | nindent 8 }}
              {{- end }}
              {{- with .Values.affinity }}
              affinity:
                {{- toYaml . | nindent 8 }}
              {{- end }}
              {{- with .Values.tolerations }}
              tolerations:
                {{- toYaml . | nindent 8 }}
              {{- end }}
        EOF
        ```

## Run your Helm chart

1. [Run your Helm chart](https://docs.microsoft.com/en-us/azure/aks/quickstart-helm#run-your-helm-chart)

    1. Install Helm chart
       using
       [helm install](https://helm.sh/docs/helm/helm_install/).

        ```console
        cd ~/misc.git/azure-voting-app-redis
        helm install azure-vote-front azure-vote-front/
        ```

    1. Wait for Helm chart to run
       using
       [kubectl get service](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#get).
       Example:

        ```console
        kubectl get service azure-vote-front --watch
        ```

## View results

From the `kubectl get service ...` command output, use the `<EXTERNAL-IP>` as the address in a web-browser.

## Delete the cluster

1. [Delete the cluster](https://docs.microsoft.com/en-us/azure/aks/quickstart-helm#delete-the-cluster)
   using
   [az group delete](https://docs.microsoft.com/en-us/cli/azure/group?view=azure-cli-latest#az_group_delete)

    ```console
    az group delete \
        --name ${AZ_RESOURCE_GROUP_NAME} \
        --yes \
        --no-wait
    ```
