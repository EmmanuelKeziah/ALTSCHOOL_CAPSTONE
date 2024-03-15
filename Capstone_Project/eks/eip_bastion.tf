 /* # To create elastic IP for bastion host
resource "aws_eip" "eip_bastion" {
  depends_on = [module.ec2_bastion, module.vpc]
  vpc = true
  instance = module.ec2_bastion.id
  tags = local.common_tags
} */
