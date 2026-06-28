# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Azure Container Registry (ACR)
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = false
}

# Azure Kubernetes Service (AKS) Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "cloudscale"

  oidc_issuer_enabled = true
  
  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.node_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "DevOps"
    Project     = "CloudScale"
  }
}

# Role Assignment - ACR Pull permissions for AKS
# resource "azurerm_role_assignment" "acr_pull" {
# principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
#  role_definition_name             = "AcrPull"
# scope                            = azurerm_container_registry.acr.id
# skip_service_principal_aad_check = true
#}