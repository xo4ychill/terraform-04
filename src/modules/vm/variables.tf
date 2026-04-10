variable "vm_name" {
  type = string
}

variable "labels" {
  type = map(string)
}

variable "zone" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "cores" {
  type = number
}

variable "memory" {
  type = number
}

variable "core_fraction" {
  type = number
}

variable "disk_size" {
  type = number
}

variable "user_data" {
  type = string
}