/* #Variables for AWS EC2 Bastion Host 

# AWS EC2 Instance Type
variable "bastion_instance_type" {
  description = "The type of EC2 instance to launch for the Bastion Host"
  type        = string
  default     = "t2.medium"
}

# Key Pair for AWS EC2 Instance
variable "bastion_instance_keypair"
    descrition ="The key pair that wll be used to access the EC2 Instance"
    type       = string
*/
