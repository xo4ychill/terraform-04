variable "cloud_id" {
  type = string
}

variable "folder_id" {
  type = string
}

variable "default_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "service_account_key_file" {
  description = "Path to service account key JSON"
  type        = string
  sensitive   = true
}

variable "vpc_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "v4_cidr_blocks" {
  type = list(string)
}

variable "image_family" {
  type = string
}

variable "ssh_public_key" {
  type = string
}

variable "allowed_ssh_cidr" {
  type = string
}

variable "environment" {
  type = string
}

# Переменная 1: одиночный IP-адрес
variable "single_ip" {
  description = "IP-адрес"
  type        = string

  validation {
    condition     = can(regex("^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", var.single_ip))
    error_message = "Invalid IP address format. Must be a valid IPv4 address (e.g., 192.168.0.1)."
  }
}

# Переменная 2: список IP-адресов
variable "ip_list" {
  description = "Список IP-адресов"
  type        = list(string)

  validation {
    condition = alltrue([
      for ip in var.ip_list : can(regex("^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", ip))
    ])
    error_message = "All items in the list must be valid IPv4 addresses."
  }
}