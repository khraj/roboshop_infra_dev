#!/bin/bash
component=$1
dnf install ansible -y
#ansible-pull -U https://github.com/khraj/ansible-roboshop-roles-tf.git -e component=$component main.yaml


REPO_URL = https://github.com/khraj/ansible-roboshop-roles-tf.git
REPO_DIR = /opt/roboshop/ansible
ANSIBLE_DIR = ansible-roboshop-roles-tf


mkdir -p $REPO_DIR
mkdir -p /var/log/roboshop
touch /var/log/roboshop/ansible.log
cd $REPO_DIR
if [ ! -d "$ANSIBLE_DIR" ]; then
    git clone $REPO_URL
    cd $ANSIBLE_DIR
else
    cd $ANSIBLE_DIR
    git pull
fi

ansible-playbook -e component=$component main.yaml