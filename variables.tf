variable "registryname" {
    description   = "Unique Name of Registry" 
    type          = string
}

variable "ecr_region" {
    description   = "Region to Create ECR Registry" 
    type          = string
}

variable "replica_region" {
    description   = "Region to Replicate ECR Registry" 
    type          = string
}