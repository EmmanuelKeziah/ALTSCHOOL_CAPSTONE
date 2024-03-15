# # Create AWS EKS Node Group for private subnet
# resource "aws_eks_node_group" "eks_ng_private" {
#   cluster_name    = aws_eks_cluster.eks_cluster.name
#   node_group_name = "${local.name}-eks-private-ng"
#   node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
#   subnet_ids      = module.vpc.private_subnets
#   version         = var.cluster_version

#   ami_type       = "AL2_x86_64"
#   capacity_type  = "ON_DEMAND"
#   disk_size      = 20
#   instance_types = ["t2.xlarge"]

#   remote_access {
#     ec2_ssh = "Sock_project" # If you specify this configuration, but do not specify source_security_group_ids when you create an EKS Node Group port 22 is open to the Internet 
#   }

#   scaling_config {
#     desired_size = 2
#     max_size     = 2
#     min_size     = 1
#   }

#   # Specifies the maximum percentage of worker nodes that can be unavailable during a node group update.
#   update_config {
#     max_unavailable = 1
#     #max_unavailable_percentage = 50    # ANY ONE TO USE
#   }

#   # Ensures that the IAM Role permissions are created before and deleted after handling the EKS Node Group.
#   # This ensures proper deletion of EC2 Instances and Elastic Network Interfaces by EKS.
#   depends_on = [
#     aws_iam_role_policy_attachment.eks_AmazonEKSWorkerNodePolicy,
#     aws_iam_role_policy_attachment.eks_AmazonEKS_CNI_Policy,
#     aws_iam_role_policy_attachment.eks_AmazonEC2ContainerRegistryReadOnly,
#   ]

#   tags = {
#     Name = "Private-Node-Group"
#   }
# }
