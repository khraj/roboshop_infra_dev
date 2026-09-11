#!/bin/bash

growpart /dev/nvme0n1 4
lvextend -L +30G /dev/mapper/RootVG-homeVol
xfs_growfs /home

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform


#creating databases

cd /home/ec2-user
git clone https://github.com/khraj/roboshop_infra_dev.git
cd roboshop_infra_dev/40-databases
sudo chown -R ec2-user:ec2-user roboshop_infra_dev
terraform init
terraform apply -auto-approve


#installing awscli

sudo yum install awscli -y