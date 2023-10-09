resource "azurerm_resource_group" "bkyaks" {
  name     = var.resource_group_name
  location = var.locations

}

resource "azurerm_role_assignment" "role_acrpull" {
  scope                            = azurerm_container_registry.reg-acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.bkyakscl.kubelet_identity.0.object_id
  skip_service_principal_aad_check = true
}

resource "azurerm_container_registry" "reg-acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.locations
  sku                 = "Standard"
  admin_enabled       = false

}
resource "azurerm_kubernetes_cluster" "bkyakscl" {
  name                = var.aks_cluster_name
  location            = var.locations
  resource_group_name = var.resource_group_name
  dns_prefix          = var.cluster_name

  default_node_pool {
    name       = "default"
    node_count = var.aks_node_count
    vm_size    = "Standard_A2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "kubenet"
  }

  tags = {
    Environment = "Production"
  }
}

resource "local_file" "kubeconfig" {
  depends_on = [azurerm_kubernetes_cluster.bkyakscl]
  content    = azurerm_kubernetes_cluster.bkyakscl.kube_config_raw
  filename   = "kubeconfig"
}
