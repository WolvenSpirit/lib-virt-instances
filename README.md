# Setup KVM and virt-manager

This repository contains a few scripts to run multiple server vm instances easily on your debian based machine.
The main reason for why one would want such a thing would be to try to practice running diverse clusters and distributed applications layerered on top.
This is an attempt to  replicate remote servers that you would normally have to buy to have access to.

### Install and setup kvm and virt-manager

`sudo sh kvm-install.sh`

### Download the default vm image (Ubuntu server 20)

`sudo sh ubuntu-instance.sh`

### Create vm instance

Run the command `sudo sh kvm-i.sh` and follow the prompts for installing the guest operating system

### Clone from your original guest instance to skip doing the second install

`sudo virt-clone --original <mydomainname> --name <newdomainname> --auto-clone`

### Useful commands

- Start guest vm `sudo virsh start <mydomainname>`

- Suspend guest vm `sudo virsh suspend <mydomainname>`

- Resume guest vm `sudo virsh resume <mydomainname>`

- Stop guest vm `sudo virsh shutdown <mydomainname>`

- List guest vm list `sudo virsh list --all`

### Additional notes

- Run `ifconfig` and find the default bridge connection created by virt-manager

- Start the default lib-virt network `sudo virsh net-start default`

- In case the default bridge isn't up `sudo ip link set virbr0 up`

- Find the address specified on the bridge interface, in my case `192.168.122.1`.

- Install netdiscover `sudo apt install netdiscover`  and run a scan to find your guest vm's that are exposed through the bridge `sudo netdiscover -i virbr0`

- SSH into your guest server - example `ssh <myname@192.168.122.3>`

- If cloned server has same ip as the original server then run on the server `sudo systemd-machine-id-setup`

- Change hostname using `hostnamectl set-hostname <newhostname>`
