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

variable "ip_address" {
  type        = string
  description = "ip-адрес"

  validation {
    condition = can(regex(
      "^(25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})\\.(25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})\\.(25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})\\.(25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})$",
      var.ip_address
    ))

    error_message = "Invalid IP address format"
  }
}