# EKS Cluster Input Variables
variable "cluster_name" {
  description = "A distinctive name for the EKS cluster. This name will serve as a prefix for associated resources."
  type        = string
}

variable "cluster_service_ipv4_cidr" {
  description = "The IPv4 CIDR block for the Kubernetes cluster's services."
  type        = string
}

variable "cluster_version" {
  description = "The minor version of Kubernetes to be utilized for the EKS cluster (e.g., 1.21)."
  type        = string
}

variable "cluster_endpoint_private_access" {
  description = "Determines whether the private API server endpoint for Amazon EKS is enabled or disabled."
  type        = bool
}

variable "cluster_endpoint_public_access" {
  description = "Determines whether the public API server endpoint for Amazon EKS is enabled or disabled. If set to `false`, ensure proper private access with `cluster_endpoint_private_access = true`."
  type        = bool
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "A list of CIDR blocks that are allowed to access the public API server endpoint for Amazon EKS."
  type        = list(string)
}
