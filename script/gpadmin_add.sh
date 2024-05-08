#!/bin/bash
useradd gpadmin
echo "gpadmin    ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sudo -k
sudo -u gpadmin ssh-keygen -t rsa -b 2048 -N '' -f /home/gpadmin/.ssh/id_rsa
sudo -u gpadmin /bin/cat /home/gpadmin/.ssh/id_rsa.pub >> /home/gpadmin/.ssh/authorized_keys
sudo -u gpadmin sudo chmod 600 /home/gpadmin/.ssh/authorized_keys
