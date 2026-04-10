output "vm_ips" {

  value = {
    for k, vm in module.vm :
    k => vm.external_ip
  }

}