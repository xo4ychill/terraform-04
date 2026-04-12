terraform {
  #  Требуемая версия Terraform
  required_version = ">= 1.12.0"

  #  Подключение провайдеров
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.100"
    }
  }

  #  Remote state в Yandex Object Storage (S3-совместимый backend)
  backend "s3" {
    bucket = "tf.state-bucket"   # имя bucket (уникальное!)
    key    = "terraform.tfstate"        # путь к state внутри bucket
    region = "ru-central1"

    #  Встроенный механизм блокировок (Terraform >= 1.6)
    use_lockfile = true

    #  endpoint для Yandex Cloud (ВАЖНО!)
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }

    #  обязательные параметры для YC (иначе будут ошибки)
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}

#  Провайдер Yandex Cloud
provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
  service_account_key_file = pathexpand(var.service_account_key_file)
}