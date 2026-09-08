#create an EC2 instance for catalogue service
resource "aws_instance" "catalogue" {
  ami                    = local.ami_id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [local.catalogue_sg_id]
  subnet_id              = local.private_subnet_ids
  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-catalogue"
    }
  )
}


#connect to instance using remote-exec provisioner and install the catalogue service

resource "terraform_data" "catalogue" {
  triggers_replace = [
    aws_instance.catalogue.id
  ]

  connection {
    type        = "ssh"
    host        = aws_instance.catalogue.private_ip
    user        = "ec2-user"
    password    = "DevOps321"
  }
  #terraform copeies this file to catalogue server
  provisioner "file" {
    source      = "catalogue.sh"
    destination = "/tmp/catalogue.sh"
  }

  provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/catalogue.sh",
        /* "sudo sh /tmp/bootstrap.sh" */
        "sudo sh /tmp/catalogue.sh catalogue"
    ]
  }

}