#!/bin/bash

apt update

apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils

adduser $USER libvirt

adduser $USER kvm

systemctl enable --now libvirtd

systemctl status libvirtd

apt install -y virt-manager

# option 1 - Start the virt-manager GUI program 
# option 2 - Use virt-install cli program



