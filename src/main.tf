terraform {
  required_version = "~> 1.12.0"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.97"
    }
  }
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

data "yandex_compute_image" "ubuntu" {
  family = var.image_family
}

data "yandex_vpc_subnet" "default" {
  name = var.subnet_name
}

# Генерация cloud-init из шаблона
locals {
  cloud_init_content = templatefile("${path.module}/cloud-init.yml.tpl", {
    ssh_public_key = var.ssh_public_key
  })
}

# Модуль для ВМ marketing (первый вызов)
module "marketing_vm" {
  source = "./modules/vm"   # или remote-модуль, но без provider внутри

  name        = "marketing-vm"
  platform_id = "standard-v1"
  resources = {
    cores  = 2
    memory = 2
  }
  image_id    = data.yandex_compute_image.ubuntu.id
  subnet_id   = data.yandex_vpc_subnet.default.id
  preemptible = true
  metadata = {
    user-data = local.cloud_init_content
  }
  labels = {
    project = "marketing"
  }
}

# Модуль для ВМ analytics (второй вызов)
module "analytics_vm" {
  source = "./modules/vm"

  name        = "analytics-vm"
  platform_id = "standard-v1"
  resources = {
    cores  = 2
    memory = 2
  }
  image_id    = data.yandex_compute_image.ubuntu.id
  subnet_id   = data.yandex_vpc_subnet.default.id
  preemptible = true
  metadata = {
    user-data = local.cloud_init_content
  }
  labels = {
    project = "analytics"
  }
}