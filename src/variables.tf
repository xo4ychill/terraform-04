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