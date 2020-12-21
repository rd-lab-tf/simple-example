module "my_instance" {
  source                    = "./module-source-code"
  my_external_ip            = var.my_external_ip 
  ssh_pub_key_absolute_path = var.ssh_pub_key_absolute_path
}

