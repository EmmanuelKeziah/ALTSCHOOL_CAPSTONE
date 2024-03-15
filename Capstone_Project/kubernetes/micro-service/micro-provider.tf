terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

# Data block for retrieving AWS EKS cluster information
data "aws_eks_cluster" "hr-development-eks-demo" {
  name = "hr-development-eks-demo"
}

# Data block for retrieving AWS EKS cluster authentication information
data "aws_eks_cluster_auth" "hr-development-eks-demo_auth" {
  name = "hr-development-eks-demo_auth"
}

# Provider block for configuring the Kubernetes provider
provider "kubernetes" {
  host                   = data.aws_eks_cluster.hr-development-eks-demo.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.hr-development-eks-demo.certificate_authority[0].data)
  version                = "2.16.1"
  config_path            = "~/.kube/config"
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", "hr-development-eks-demo"]
    command     = "aws"
  }
}

# Resource block for creating a Kubernetes namespace
resource "kubernetes_namespace" "kube-namespace" {
  metadata {
    name = "sock-shop"
  }
}
