#!/bin/bash

growpart /dev/nvme0n1 4
lvextend -L +30G /dev/mapper/RootVG-homeVol
xfs_growfs /home

yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum -y install terraform
yum install awscli -y

#creating databases

# cd /home/ec2-user
# git clone https://github.com/khraj/roboshop_infra_dev.git
# cd roboshop_infra_dev/40-databases
# sudo chown -R ec2-user:ec2-user roboshop_infra_dev
# terraform init
# terraform apply -auto-approve

if [ ! -d "/home/ec2-user/roboshop_infra_dev" ]; then
    sudo -u ec2-user git clone https://github.com/khraj/roboshop_infra_dev.git
fi

sudo -u ec2-user bash -c '
    cd /home/ec2-user/roboshop_infra_dev/40-databases
    terraform init
    terraform apply -auto-approve

