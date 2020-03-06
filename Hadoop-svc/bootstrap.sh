#!/bin/bash

# Update the system
# echo "Updating system"
yum update -y 

# Install some packages
echo "Installing important packages"
yum install -y redhat-lsb-core net-tools ansible bind-utils wget bash-completion bash-completion-extras vim unzip xorg-x11-xauth xorg-x11-fonts-* xorg-x11-font-utils xorg-x11-fonts-Type1

# Enable password authentication for fast recap
echo "Enabling password authentication in sshd config"
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl reload sshd

# Disable SELinux
echo "Disable SELinux"
setenforce 0
sed -i --follow-symlinks 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux

# Set Root password for fast recap
echo "Set root password"
echo "ali" | passwd --stdin root >/dev/null

# start  firewalld
echo "start firewalld"
systemctl stop firewalld
