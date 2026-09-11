variable "component" {
  default = "catalogue"
}

variable "rule_priority" {
  default = 10
}

variable "domain_name" {
  default = "inkweave.dpdns.org"
}

variable "project_name" {
  type = string
  default = "roboshop"
}

variable "environment" {
  type = string
  default = "dev"
}