variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "vnet" {
  type        = string
  description = "vnet name in Azure"
}

variable "postgresql" {
  type        = string
  description = "postgress server name in Azure"
}

variable "postgresql_database" {
  type        = string
  description = "database name in Azure"
}
variable "login" {
  type        = string
  description = "login id in Azure"
  sensitive   = true
}

variable "password" {
  type        = string
  description = "password in Azure"
  sensitive   = true
}

variable "subnet_name" {
  type        = string
  description = "subnet name in Azure"
}

variable "app_service_plan" {
  type        = string
  description = "app_service_plan name in Azure"
}

variable "app_service" {
  type        = string
  description = "app_service name in Azure"
}

variable "connection_string" {
  type        = string
  description = " connection_string in Azure"
  sensitive   = true
}

variable "app_service2" {
  type        = string
  description = " connection_string in Azure"
  sensitive   = true
}

variable "app_service_plan2" {
  type        = string
  description = " connection_string in Azure"
  sensitive   = true
}