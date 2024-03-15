/* # Create a null_resource to run the bastion_provisioner.sh script
resource "null_resource" "copy_ec2_keys" {
    depends_on = [module.ec2_bastion]

    type = "ssh"
    host = aws_eip.eip_bastion.public_ip
    user = "ec2-user"
    password = ""
    private_key = file("private-key/eks-tf-keypair.pem")
}


# Copy the terraform-key.pem file to /tmp/terraform-key.pem
    provisioner "file" {
        source = "private-key/eks-tf-keypair.pem"
        destination = "/tmp/eks-tf-keypair.pem"
    }
    provisioner "remote-exec" {
        inline = [
            "sudo chmod 400 /tmp/eks-tf-keypair.pem"
        ]
    }

    #Local-exec provisioner to run the bastion_provisioner.sh script
        command   = "echo VPC created on `date` and VPC ID is ${module.vpc.vpc_id} >> creation-time-vpc-id.txt" working_dir = "local-exec-output-files/"
        #on_failure = continue
    }
} */
