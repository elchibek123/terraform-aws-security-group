########## AWS Security Group ##########

variable "vpc_id" {
  type        = string
  description = "This is a vpc id"
}

variable "ingress_ports" {
  type        = list(string)
  description = "This is a list of ports for Ingress Rule"
  default     = []
}

variable "create_cidr_blocks" {
  description = "Set to true if the NAT Gateway should be created, false otherwise"
  type        = bool
  default     = false
}

variable "cidr_blocks" {
  type        = list(string)
  description = "This is ingress cidr blocks"
  default     = []
}

variable "create_source_security_group" {
  description = "Set to true if the NAT Gateway should be created, false otherwise"
  type        = bool
  default     = false
}

variable "source_security_group_id" {
  description = "List of ingress rules to create where 'source_security_group_id' is used"
  type        = string
  default     = ""
}

########## Tags ##########

variable "tags" {
  type        = map(string)
  description = "these are resource tags"
  default     = {}
}

variable "sg_name" {
  type        = string
  description = "This is Security Group name"
  default     = ""
}