locals {
  my_external_ip = var.my_external_ip == "" ? chomp(data.http.my_external_ip.body) : var.my_external_ip
}

resource "aws_security_group" "for_my_instance" {
  name        = "my instance security group"
  description = "For my_instance"
  vpc_id      = data.aws_vpc.default.id
  tags = {
      Name = "my_instance_sg"
  }
}

resource "aws_security_group_rule" "allow_ingress_all_from_my_ip" {
  description       = "Allow all connection from my external IP"
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.for_my_instance.id
  cidr_blocks = [ "${local.my_external_ip}/32" ]
}

resource "aws_security_group_rule" "allow_egress_all" {
  description       = "Allow egress all"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.for_my_instance.id
}