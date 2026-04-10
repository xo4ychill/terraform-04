resource "yandex_compute_instance" "vm" {

  name = var.vm_name
  zone = var.zone

  labels = var.labels

  resources {
    cores         = var.cores
    memory        = var.memory
    core_fraction = var.core_fraction
  }

  boot_disk {

    initialize_params {
      image_id = "fd8n2m74r0s8s5f4c3k5"
      size     = var.disk_size
    }

  }

  network_interface {

    subnet_id = var.subnet_id
    nat       = true

  }

  metadata = {

    user-data = var.user_data

  }

}
