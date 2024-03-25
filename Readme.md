
Sock-Shop Application Deployment Guide
Welcome to the Sock-Shop Application Deployment Guide. This guide provides step-by-step instructions on how to deploy the Sock-Shop application on AWS EKS (Elastic Kubernetes Service) using Jenkins.

Overview
The Sock-Shop application is a microservices-based e-commerce website that sells socks. The application is composed of multiple services that interact with each other to provide the functionality of the website. The deployment process involves setting up the required infrastructure on AWS, configuring Kubernetes clusters, and deploying the Sock-Shop application on the cluster.

Structure of Repository
- eks : This folder contains the configuration files and resources for setting up the AWS infrastructure and EKS clusters. The files are written using Terraform. The files include:
    - eks/01-version.tf : This Terraform configuration script is designed to ensure compatibility with the required version Terraform 1.o or higher and utilizes the AWS provider for HashiCorp.

    - eks/02-01-generic-variables.tf: This file provides a structured approach to defining input variables essential for configuring the AWS environment. The variables include the environment,business configurations and details required for the deployment of the Sock-Shop application and EKS cluster on AWS.

    ```
    variable "region" {
      description = "The AWS region where the resources will be deployed."
      type        = string
      default     = "us-west-2"
    }
    ```
    Here, the region variable specifies the AWS region where the resources will be deployed. The default value is set to "us-west-2".

    - eks/02-02-local-values.tf: 




    - variable files: Contains the variables required for the deployment.
    - output files: Contains the output variables that are displayed after the deployment is completed.
    - ".tfvars" files: Contains the values for the variables defined in the variable files.




_Author: Emmanuel Keziah_

_Date: 2024-03-18_


_Sock-Shop Application Deployment Guide_
Welcome to the Sock-Shop Application Deployment Guide. This guide provides step-by-step instructions on how to deploy the Sock-Shop application on AWS EKS (Elastic Kubernetes Service) using Jenkins.

_Overview_
The Sock-Shop application is a microservices-based e-commerce website that sells socks. The application is composed of multiple services that interact with each other to provide the functionality of the website. The deployment process involves setting up the required infrastructure on AWS, configuring Kubernetes clusters, and deploying the Sock-Shop application on the cluster.

_Structure of Repository_
- eks : This folder contains the configuration files and resources for setting up the AWS infrastructure and EKS clusters. The files are written using Terraform. The files include:
    - _eks/01-version.tf_ : This Terraform configuration script is designed to ensure compatibility with the required version Terraform 1.o or higher and utilizes the AWS provider for HashiCorp.

    - _eks/02-01-generic-variables.tf_: This file provides a structured approach to defining input variables essential for configuring the AWS environment. The variables include the environment,business configurations and details required for the deployment of the Sock-Shop application and EKS cluster on AWS.

    ```
    variable "region" {
      description = "The AWS region where the resources will be deployed."
      type        = string
      default     = "us-west-2"
    }
    ```
    Here, the region variable specifies the AWS region where the resources will be deployed. The default value is set to "us-west-2".

    - _eks/02-02-local-values.tf_: This file contains the local values that are used to set the default values for the variables defined in the generic-variables.tf file. The local values are used to set the default values for the variables based on the environment and business requirements.

    ```
    locals {
    owners           = var.business_division
     environment      = var.environment
     name             = "${var.business_division}-${var.environment}"
     eks_cluster_name = "${local.name}-${var.cluster_name}"

   # Group owners and environment into common_tags
    common_tags = {
     owners      = local.owners
     environment = local.environment
  }
 }
    ```
    The local values define the owners, environment, name, and EKS cluster name based on the business division, environment, and cluster name variables.

   - _eks/03-01-vpc-variables.tf_: This file contains specifies the variables required for setting up the VPC (Virtual Private Cloud) on AWS. The variables include the VPC CIDR block, subnet CIDR blocks, and other configuration details required for the VPC setup.

- _eks/03-02-vpc-module.tf_: This file contains the Terraform configurations for setting up the VPC(Virtual Private Cloud) on AWS. The module defines the VPC, subnets, route tables, and other networking resources required for the VPC setup. The module is reusable and can be used to create VPCs with different configurations.

-_eks/03-03-vpc-outputs.tf_: This Terraform script provides essential output values after creating a Virtual Private Cloud (VPC) using the specified module. The outputs include crucial information about the VPC configuration, such as its ID, CIDR blocks, subnets, NAT gateway public IPs, and availability zones.

- _eks/04-01-bastion-variables.tf_: This file contains the variables required for setting up the bastion host on AWS. The variables include the instance type, AMI ID, key pair name, and other configuration details required for the bastion host setup. The other bastion files contain configurations that will ensure the bastion host is deployed successfully.

- _eks/05-01-eks-variables.tf_: This file contains the variables required for setting up the EKS (Elastic Kubernetes Service) cluster on AWS. The variables include the EKS cluster name, version, instance type, and other configuration details required for the EKS cluster setup. Similarly, the other eks files contain configurations that will ensure the EKS cluster is deployed successfully.

- _eks/05-02-eks-output.tf_: This file contains the output values after creating the EKS cluster on AWS. The outputs include essential information about the EKS cluster configuration, such as its name, version, endpoint, security group IDs, and other details.

-_eks/05-03-iamrole-eks.tf_: This file contains the Terraform configurations for creating the IAM roles and policies required for the EKS cluster on AWS. The configurations include the IAM role for the EKS service, the IAM role for the worker nodes, and the policies attached to the roles.

- _eks/05-04-iamrole-nodegroup.tf_: This file contains the variables required for setting up the EKS node group on AWS. The variables include the node group name, instance type, desired capacity, and other configuration details required for the node group setup.

-_eks.auto.tfvars_: This file contains the values for the variables defined in the variable files. The values include the region, availability zones, VPC details, subnet details, and other configuration details required for the deployment.

- _terraform.tfvars_: This terraform module utilizes this file to define the values for the variables required for the deployment. The values include the region, availability zones, VPC details, subnet details, and other configuration details required for the deployment.

- _vpc.auto.tfvars_: This file contains the values for the variables defined in the variable files. The values include the region, availability zones, VPC details, subnet details, and other configuration details required for the deployment.



