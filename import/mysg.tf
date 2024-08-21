# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "sg-02a4d34a128ea94ef"
resource "aws_security_group" "mysg" {
  description = "ActiveDirectory SG"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "DNS queries to external or internal DNS servers."
    from_port        = 53
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 53
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = " RPC endpoint mapper"
    from_port        = 135
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 135
    }, {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "DNS"
    from_port        = 53
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 53
    }, {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Kerberos authentication"
    from_port        = 88
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 88
    }, {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "LDAP (Lightweight Directory Access Protocol)"
    from_port        = 389
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 389
    }, {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "rdp"
    from_port        = 3389
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 3389
  }]
  name                   = "mysg"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all               = {}
  vpc_id                 = "vpc-0c4070b1579133e3a"
}
