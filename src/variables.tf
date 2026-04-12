/*variable "token" {
  type        = string
  sensitive   = true
  description = "Yandex Cloud OAuth token"
}
*/

variable "cloud_id" {
  description = "ID облака Yandex Cloud"
  type        = string
}

variable "folder_id" {
  description = "ID каталога Yandex Cloud"
  type        = string
}

variable "default_zone" {
  description = "Зона доступности"
  type        = string
  default     = "ru-central1-a"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "service_account_key_file" {
  type = string
}

variable "ssh_public_key" {
  description = "Публичный SSH-ключ для доступа к ВМ"
  type        = string
  sensitive   = true
}

variable "image_family" {
  description = "Семейство образа ОС"
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "subnet_name" {
  description = "Имя подсети (должна существовать)"
  type        = string
  default     = "develop"
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