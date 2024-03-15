# EKS Cluster Outputs
output "cluster_id" {
  description = "The unique identifier of the EKS cluster."
  value       = aws_eks_cluster.eks_cluster.id
}

output "cluster_arn" {
  description = "The Amazon Resource Name (ARN) associated with the EKS cluster."
  value       = aws_eks_cluster.eks_cluster.arn
}

output "cluster_certificate_authority_data" {
  description = "The base64 encoded certificate data required to securely communicate with the EKS cluster."
  value       = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "cluster_endpoint" {
  description = "The endpoint URL for accessing the Kubernetes API of the EKS cluster."
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_version" {
  description = "The version of the Kubernetes server running on the EKS cluster."
  value       = aws_eks_cluster.eks_cluster.version
}

output "cluster_iam_role_name" {
  description = "The name of the IAM role associated with the EKS cluster."
  value       = aws_iam_role.eks_master_role.name
}

output "cluster_iam_role_arn" {
  description = "The Amazon Resource Name (ARN) associated with the IAM role of the EKS cluster."
  value       = aws_iam_role.eks_master_role.arn
}

output "cluster_oidc_issuer_url" {
  description = "The URL of the OIDC issuer for the EKS cluster."
  value       = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

output "cluster_primary_security_group_id" {
  description = "The ID of the primary security group created by the EKS cluster. This security group is referred to as 'Cluster security group' in the EKS console."
  value       = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
}

# EKS Node Group Outputs - Public
output "node_group_public_id" {
  description = "The unique identifier of the public node group in the EKS cluster."
  value       = aws_eks_node_group.eks_public_ng.id
}

output "node_group_public_arn" {
  description = "The Amazon Resource Name (ARN) associated with the public node group in the EKS cluster."
  value       = aws_eks_node_group.eks_public_ng.arn
}

output "node_group_public_status" {
  description = "The current status of the public node group in the EKS cluster."
  value       = aws_eks_node_group.eks_public_ng.status
}

output "node_group_public_version" {
  description = "The Kubernetes version running on the public node group in the EKS cluster."
  value       = aws_eks_node_group.eks_public_ng.version
}



# EKS Node Group Outputs - Private
/*
output "node_group_private_id" {
  description = "Node Group 1 ID"
  value       = aws_eks_node_group.eks_ng_private.id
}
output "node_group_private_arn" {
  description = "Private Node Group ARN"
  value       = aws_eks_node_group.eks_ng_private.arn
}
output "node_group_private_status" {
  description = "Private Node Group status"
  value       = aws_eks_node_group.eks_ng_private.status 
}
output "node_group_private_version" {
  description = "Private Node Group Kubernetes Version"
  value       = aws_eks_node_group.eks_ng_private.version
}
*/
