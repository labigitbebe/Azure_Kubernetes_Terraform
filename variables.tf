variable "resource_group_name" {
  type        = string
  description = "AKS Resorce group"
}
variable "locations" {
  type        = string
  description = "Resource location in Azure"
}

variable "acr_name" {
  type        = string
  description = "ACR Registry name"
}
variable "aks_cluster_name" {
  type        = string
  description = "AKS cluster name"
}
variable "aks_node_count" {
  type        = string
  description = "AKS node count"
}
variable "cluster_name" {
  type        = string
  description = "aks-dns-cluster name"
}
