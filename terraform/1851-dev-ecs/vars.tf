variable "region" {
  default = "us-east-1"
}
variable "ProjectName" {
  default = "1851"
}
variable "vpc_name"{
  default = "1851-development-API-vpc"
}
variable "tf_backend_bucket_name" {
  default = "1851-stg-terraform-state"
}
variable "environment" {
  description = "Deployment Environment"
  default = "development"
}
variable "as_max_count" {
  type = number
  default = 3
}
variable "allow_overwrite" {
  type = bool
  default = true
}
variable "source_branch_name" {
  default = "development"
}

variable "domain_name" {
  default = "1851dev.com"
}

variable "task_count" {
  type = number
  default = 1
}
variable "container_port" {
  type = number
  default = 3000
}

variable "nginx_container_port" {
  type    = number
  default = 80
}

variable "Sandbox"{
  default = "domain2"

}

