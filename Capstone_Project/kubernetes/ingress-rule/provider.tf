# Terraform Block
terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"
    }

    kubernetes = {
        version = ">= 2.0.0"
        source = "hashicorp/kubernetes"
    }

    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

# Data Block - AWS EKS Cluster
data "aws_eks_cluster" "hr-development-eks-demo" {
  name = "hr-development-eks-demo"
}

# Data Block - AWS EKS Cluster Authentication
data "aws_eks_cluster_auth" "hr-development-eks-demo_auth" {
  name = "hr-development-eks-demo_auth"
}

# Provider Block - AWS
provider "aws" {
  region     = "eu-west-2"
}

# Provider Block - Helm
provider "helm" {
    kubernetes {
       #host                   = data.aws_eks_cluster.hr-development-eks-demo.endpoint
      # cluster_ca_certificate = base64decode(data.aws_eks_cluster.hr-development-eks-demo.certificate_authority[0].data)
       #token                  = data.aws_eks_cluster_auth.hr-development-eks-demo_auth.token
       config_path = "~/.kube/config"
    }
}

# Provider Block - Kubernetes
provider "kubernetes" {
  #host                   = data.aws_eks_cluster.hr-development-eks-demo.endpoint
 # cluster_ca_certificate = base64decode(data.aws_eks_cluster.hr-development-eks-demo.certificate_authority[0].data)
  #token                  = data.aws_eks_cluster_auth.hr-development-eks-demo_auth.token
 #  version          = "2.16.1"
  config_path = "~/.kube/config"
}

# Provider Block - Kubectl
provider "kubectl" {
   load_config_file = false
   alias = "aws"
   host                   = data.aws_eks_cluster.hr-development-eks-demo.endpoint
   cluster_ca_certificate = base64decode(data.aws_eks_cluster.hr-development-eks-demo.certificate_authority[0].data)
   token                  = data.aws_eks_cluster_auth.hr-development-eks-demo_auth.token
   config_path = "~/.kube/config"
}
