variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "CloudScale-RG"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "swedencentral"    # Allowed region from your list
}

variable "acr_name" {
  description = "Name of the container registry"
  type        = string
  default     = "cloudscaleacr"
}

variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
  default     = "CloudScale-AKS"
}

variable "node_count" {
  description = "Number of nodes in the cluster"
  type        = number
  default     = 2
}

variable "node_size" {
  description = "Size of the nodes"
  type        = string
  default     = "Standard_B2s_v2"    # ← FIXED: Added _v2
}