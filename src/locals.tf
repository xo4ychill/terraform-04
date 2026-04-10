locals {

  vm_config = {
    marketing = {
      name   = "marketing-vm"
      labels = { project = "marketing" }
    }

    analytics = {
      name   = "analytics-vm"
      labels = { project = "analytics" }
    }
  }

}