variable "token" {
  description = "OAuth-токен Yandex Cloud"
  type        = string
  sensitive   = true
}

variable "cloud_id" {
  description = "ID облака Yandex Cloud"
  type        = string
}

variable "folder_id" {
  description = "ID каталога Yandex Cloud"
  type        = string
}

variable "zone" {
  description = "Зона доступности"
  type        = string
  default     = "ru-central1-a"
}

variable "ssh_public_key" {
  description = "Публичный SSH-ключ для доступа к ВМ"
  type        = string
  sensitive   = true
}

variable "image_family" {
  description = "Семейство образа ОС"
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "subnet_name" {
  description = "Имя подсети (должна существовать)"
  type        = string
  default     = "default"
}