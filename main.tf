########## AWS Security Group ##########

resource "aws_security_group" "sg" {
  name        = var.sg_name
  description = "This is a security group"
  vpc_id      = var.vpc_id

  tags = merge(
    {
      "Name" = var.sg_name
    },
    var.tags,
  )
}

resource "aws_security_group_rule" "ingress_rule" {
  count             = var.create_cidr_blocks ? length(var.ingress_ports) : 0
  type              = "ingress"
  from_port         = element(var.ingress_ports, count.index)
  to_port           = element(var.ingress_ports, count.index)
  protocol          = "tcp"
  cidr_blocks       = var.cidr_blocks
  security_group_id = aws_security_group.sg.id
}

resource "aws_security_group_rule" "ingress_rule_with_source_security_group_id" {
  count                    = var.create_source_security_group ? length(var.ingress_ports) : 0
  type                     = "ingress"
  from_port                = element(var.ingress_ports, count.index)
  to_port                  = element(var.ingress_ports, count.index)
  protocol                 = "tcp"
  source_security_group_id = var.source_security_group_id
  security_group_id        = aws_security_group.sg.id
}

resource "aws_security_group_rule" "egress_rule" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg.id
}