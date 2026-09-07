variable "project_name" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "sg_names" {
    default = [
        #Databases
        "mongodb","mysql", "rabbitMQ", "redis",
        #backend
        "catalogue", "cart", "user", "shipping", "payment",
        #frontend 
        "frontend",
        #bastion
        "bastion",
        #load balancer
        "loadbalancer",
        #backend load balancer
        "backend-loadbalancer"
        ]
}
