data "aws_vpc" "default" {
  default = true
}

data "aws_ami" "centos_8" {
  owners = [ "aws-marketplace" ]

  filter {
    name   = "product-code"
    values = ["47k9ia2igxpcce2bzo8u3kj03"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "local_file" "my_public_ssh_key" {
  filename = var.ssh_pub_key_absolute_path
}
