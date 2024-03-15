/* # AWS EC2 Instance Terraform Outputs
# Public EC2 Instances - Bastion Host
# ec2_bastion_public_instance_ids
output "ec2_bastion_public_instance_ids" {
    description = "List of IDs of public EC2 instances"
    value       = module.ec2_bastion.id
}

# EC2_bastion_public_ip
output "ec2_bastion_eip" {
    description = "Elastic IP associated with the Bastion Host"
    value       = aws_eip.bastion_eip.public_ip
} */


