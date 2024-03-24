Author: Emmanuel Keziah
Date: 2024-03-18


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
