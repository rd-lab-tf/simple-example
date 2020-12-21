variable "ssh_pub_key_absolute_path" {
  description = "Path to your SSH public key to add it as a AWS key pair"
  type        = string
}

variable "my_external_ip" {
  description = "You external IP (could be obtained by command <curl https://ipinfo.io/ip>)"
  type = string
  default = ""
}

variable "aws_region" {
  default = "eu-west-1"
}

variable "aws_profile" {
  description = "Your AWS credentials profile name"
  default = "default"
}