variable "ssh_pub_key_absolute_path" {
  description = "Path to your SSH public key to add it as a AWS key pair"
  type        = string
}

variable "my_external_ip" {
  description = "You external IP (could be obtained by command <curl https://ipinfo.io/ip>)"
  type = string
}

module "my_instance" {
  source                    = "./module-source-code"
  my_external_ip            = var.my_external_ip 
  ssh_pub_key_absolute_path = var.ssh_pub_key_absolute_path
}

