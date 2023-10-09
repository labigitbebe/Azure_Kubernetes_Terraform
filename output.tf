output "client_certificate" {
  value     = azurerm_kubernetes_cluster.bkyakscl.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.bkyakscl.kube_config_raw

  sensitive = true
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.bkyakscl.fqdn
}

output "aks_id" {
  value = azurerm_kubernetes_cluster.bkyakscl.id
}

output "acr_id" {
  value = azurerm_container_registry.reg-acr.id
}