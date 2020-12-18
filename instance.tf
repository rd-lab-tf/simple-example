resource "aws_instance" "my_instance" {
    count                  = var.instance_count
    ami                    = data.aws_ami.centos_7.id
    instance_type          = var.instance_type  
    key_name               = aws_key_pair.my_public_ssh_key.id
    vpc_security_group_ids = [ aws_security_group.for_my_instance.id ]

    tags = {
        Name = "my_instance"
    }
}