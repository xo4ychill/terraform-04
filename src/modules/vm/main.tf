resource "yandex_compute_instance" "this" {
  name        = var.name
  platform_id = var.platform_id
  resources {
    cores  = var.resources.cores
    memory = var.resources.memory
  }
  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }
  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }
  metadata    = var.metadata
  labels      = var.labels
  preemptible = var.preemptible
}