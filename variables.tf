variable "ssh_public_key" {
  description = "SSH public key used to access the Azure VMs"
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "Name of the Azure Resource group"
  type        = string
  default     = "terra-learn"
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "East Asia"
}