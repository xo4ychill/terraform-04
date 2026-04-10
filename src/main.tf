terraform {
  required_version = ">= 1.12.0"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
  service_account_key_file = pathexpand(var.service_account_key_file)
}

/*
# Получаем существующую VPC и подсеть по именам
data "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

data "yandex_vpc_subnet" "develop" {
  name = var.subnet_name
}
*/

# Создаём сеть
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

# Создаём подсеть
resource "yandex_vpc_subnet" "develop" {
  name           = var.subnet_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}

# Генерация cloud-init с подстановкой SSH-ключа
locals {
  cloud_init_content = templatefile("${path.module}/cloud-init.yml.tpl", {
    ssh_key = var.ssh_public_key
  })
}

# Локальный модуль для ВМ marketing
module "marketing_vm" {
  source = "./modules/vm"

  vm_name       = "vm-marketing"
  project_label = "marketing"
  subnet_id     = yandex_vpc_subnet.develop.id
  cloud_init_content = local.cloud_init_content
  zone          = var.default_zone
  image_family  = var.image_family
  preemptible   = true
}

# Локальный модуль для ВМ analytics
module "analytics_vm" {
  source = "./modules/vm"

  vm_name       = "vm-analytics"
  project_label = "analytics"
  subnet_id     = yandex_vpc_subnet.develop.id
  cloud_init_content = local.cloud_init_content
  zone          = var.default_zone
  image_family  = var.image_family
  preemptible   = true
}