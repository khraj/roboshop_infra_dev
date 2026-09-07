variable "cidr_block" {
    default = "10.0.0.0/16"
}

variable "project_name" {
    default = "roboshop"
}

variable "environment_name" {
    default = "dev"
}

variable "vpc_tags" {
    default = {
        Purpose = "roboshop VPC"
        DontDelete = "true"
    }
}

variable "public_cidrs_subnet" {
    default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "private_cidrs_subnet" {
    default = ["10.0.11.0/24","10.0.12.0/24"]
}

variable "database_cidrs_subnet" {
    default = ["10.0.21.0/24","10.0.22.0/24"]
}