variable "bkstrgrg" {
  type        = string
  description = "The name of the backend storage account resource group"
  default     = "MYFIRSTRG"
}

variable "bkstrg" {
  type        = string
  description = "The name of the backend storage account"
  default     = "backendstorageterra"
}

variable "bkcontainer" {
  type = string
  description = "The container name for the backend config"
  default = "terraformstate"
}

variable "bkstrgkey" {
  type = string
  description = "The access key for the storage account"
  default = "terraform.tfstateAKS"

}
variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}
variable "location" {
  type        = string
  description = "Resources location in Azure"
}
variable "cluster_name" {
  type        = string
  description = "AKS name in Azure"
}
variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
}
variable "system_node_count" {
  type        = number
  description = "Number of AKS worker nodes"
}
variable "acr_name" {
  type        = string
  description = "ACR name"
}