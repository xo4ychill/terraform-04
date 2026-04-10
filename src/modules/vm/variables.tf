variable "name" {}
variable "platform_id" {}
variable "resources" {
  type = object({
    cores  = number
    memory = number
  })
}
variable "image_id" {}
variable "subnet_id" {}
variable "metadata" {
  type    = map(string)
  default = {}
}
variable "labels" {
  type    = map(string)
  default = {}
}
variable "preemptible" {
  type    = bool
  default = false
}