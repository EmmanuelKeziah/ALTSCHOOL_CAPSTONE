# Custom Input Variables

# Custom AWS Region
variable "aws_region" {
  description = "Custom region in which AWS Resources are going to be created"
  type        = string
}

# Custom Environment Variable
variable "environment" {
  description = "Custom environment variable used as a prefix"
  type        = string
}

# Custom Business Division
variable "business_division" {
  description = "Custom business division this Infrastructure belongs"
  type        = string
}
