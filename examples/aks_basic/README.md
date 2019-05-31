# Example: AKS Basic Deployment

This script shows how to perform a basic deployment of AKS using the AKS module. It requires a minimal set of inputs and will create an AKS cluster with the following features based on default values:

- Deployment to the East US Azure region
- The latest version of Kubernetes supported in the region selected
- Basic networking (kubenet)
- Service Principal required for AKS is automatically generated
- SSH key for the nodes is automatically generated