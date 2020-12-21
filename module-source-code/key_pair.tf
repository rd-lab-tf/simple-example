
resource "aws_key_pair" "my_public_ssh_key" {
  key_name   = "My public ssh key"
  public_key = data.local_file.my_public_ssh_key.content
}