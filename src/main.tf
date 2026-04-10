resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

module "vm" {

  source = "./modules/vm"

  for_each = local.vm_config

  vm_name  = each.value.name
  labels   = each.value.labels
  zone     = var.default_zone

  subnet_id = yandex_vpc_subnet.develop.id

  cores         = var.vm_resources[each.key].cores
  memory        = var.vm_resources[each.key].memory
  core_fraction = var.vm_resources[each.key].core_fraction
  disk_size     = var.vm_resources[each.key].disk_size

  user_data = templatefile("${path.module}/templates/cloud-init.yml.tftpl", {
    ssh_key = var.vms_ssh_root_key
  })

}
