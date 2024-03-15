  [1/5]                           bastion_variable-sg.tf















/* # Security Group for the public bastion host
module "public_bastion_sg" {
    source ="terraform-aws-modules/security-group/aws"
    version = "4.17.1"

    name        = "${local.name}-public_bastion_sg"
    description = "Security Group for the public bastion host"
    vpc_id      = module.vpc.vpc_id

    # Setting Ingress Rules and CIDR blocks
    ingress_rules   = ["ssh-tcp"]
    ingress_cidr_blocks = ["0.0.0.0/0"]

    # Setting Egress Rules
    egress_rules = ["all-all"]

    # Tags
    tags = local.common_tags
} */

