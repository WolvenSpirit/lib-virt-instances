#!/bin/bash

virt-install \
--name=ubuntu1 \
--ram=1024 \
--vcpus=1 \
--disk path=/var/lib/libvirt/images/ubuntu1.qcow2,size=9 \
--cdrom ubuntu.iso \
--graphics vnc
