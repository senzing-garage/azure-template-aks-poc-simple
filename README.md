# azure-template-aks-poc-simple

## :no_entry: Deprecated

[![No Maintenance Intended](http://unmaintained.tech/badge.svg)](http://unmaintained.tech/)

If you are beginning your journey with [Senzing],
please start with [Senzing Quick Start guides].

You are in the [Senzing Garage]
where projects are "tinkered" on.
Although this GitHub repository may help you understand an approach to using Senzing,
it's not considered to be "production ready" and is not considered to be part of the Senzing product.
Heck, it may not even be appropriate for your application of Senzing!

## Synopsis

:warning: This is incomplete work -- and probably doesn't full work.

Using a Cloud-Native Application Bundle (CNAB) deploy an example Senzing stack.
An Azure ARM template for bringing up Senzing on Kubernetes (AKS)

## Overview

### Contents

1. [Expectations]
1. [Prerequisites]
    1. [Prerequisite software]
    1. [Clone repository]

## Preamble

At [Senzing], we strive to create GitHub documentation in a
"[don't make me think]" style.
For the most part, instructions are copy and paste.
Whenever thinking is needed, it's marked with a "thinking" icon :thinking:.
Whenever customization is needed, it's marked with a "pencil" icon :pencil2:.
If the instructions are not clear, please let us know by opening a new
[Documentation issue]
describing where we can improve.   Now on with the show...

### Legend

1. :thinking: - A "thinker" icon means that a little extra thinking may be required.
   Perhaps you'll need to make some choices.
   Perhaps it's an optional step.
1. :pencil2: - A "pencil" icon means that the instructions may need modification before performing.
1. :warning: - A "warning" icon means that something tricky is happening, so pay attention.

## Related artifacts

1. [DockerHub]
1. [Helm Charts]

## Expectations

- **Space:** This repository and demonstration require 20 GB free disk space.
- **Time:** Budget 4 hours to get the demonstration up-and-running, depending on CPU and network speeds.
- **Background knowledge:** This repository assumes a working knowledge of:
  - [Docker]
  - [Kubernetes]
  - [Helm]
  - [Porter]

## Prerequisites

### Prerequisite software

1. [Porter]

1. Follow steps in [clone-repository] to install the Git repository.

### In development branch

[![Deploy to Azure Button]][Deploy to Azure Dev]

### In main branch

[![Deploy to Azure Button]][Deploy to Azure Main]

## Development

### Prerequisite software for development

1. [az bicep]
    1. The instructions assume that `az bicep` is the command used, not `bicep`.

### Clone repository

1. Using these environment variable values:

    ```console
    export GIT_ACCOUNT=senzing-garage
    export GIT_REPOSITORY=azure-template-aks-poc-simple
    export GIT_ACCOUNT_DIR=~/${GIT_ACCOUNT}.git
    export GIT_REPOSITORY_DIR="${GIT_ACCOUNT_DIR}/${GIT_REPOSITORY}"
    ```

1. Follow steps in [clone-repository] to install the Git repository.

### Create ARM file

1. Create `arm-json/aks-poc-simple` JSON file.
   Example

    ```console
    cd ${GIT_REPOSITORY_DIR}
    make aks-poc-simple.json
    ```

[az bicep]: https://github.com/senzing-garage/knowledge-base/blob/master/WHATIS/bicep.md
[Clone repository]: #clone-repository
[clone-repository]: https://github.com/senzing-garage/knowledge-base/blob/master/HOWTO/clone-repository.md
[Deploy to Azure Button]: https://aka.ms/deploytoazurebutton
[Deploy to Azure Dev]: https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FSenzing%2Fazure-template-aks-poc-simple%2Fissue-3.dockter.1%2Farm-json%2Faks-poc-simple.json
[Deploy to Azure Main]: https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FSenzing%2Fazure-template-aks-poc-simple%2Fmain%2Fmain.json
[Docker]: https://github.com/senzing-garage/knowledge-base/blob/master/WHATIS/docker.md
[DockerHub]: https://hub.docker.com/r/senzing
[Documentation issue]: https://github.com/senzing-garage/template-python/issues/new?template=documentation_request.md
[don't make me think]: https://github.com/senzing-garage/knowledge-base/blob/master/WHATIS/dont-make-me-think.md
[Expectations]: #expectations
[Helm]: https://github.com/senzing-garage/knowledge-base/blob/master/WHATIS/helm.md
[Helm Charts]: https://github.com/senzing-garage/charts
[Kubernetes]: https://github.com/senzing-garage/knowledge-base/blob/master/WHATIS/kubernetes.md
[Porter]: https://github.com/senzing-garage/knowledge-base/blob/master/WHATIS/porter.md
[Prerequisites]: #prerequisites
[Prerequisite software]: #prerequisite-software
[Senzing]: https://senzing.com/
[Senzing Garage]: https://github.com/senzing-garage
[Senzing Quick Start guides]: https://docs.senzing.com/quickstart/
