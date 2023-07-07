## Servers  

Creates "servers" using docker for ansible provisioning.

If you want to use repo to use ansbile you need to do few steps:  
```
brew tap esolitos/ipa
brew install esolitos/ipa/sshpass
```
Then another necessary step
```
export ANSIBLE_HOST_KEY_CHECKING=False
```
Also ansible needs differents hosts (it's impossible to specify only "localhost"), so you need to change the "/etc/hosts"
Then make sure ports in "inventory" file is correct and run
```
ansible all -m ping 
```
__Why Docker?__

This repo uses "docker" as provider because it's really hard to make things work with vargant. Neither "virtualbox", nor "qemu-kvm", nor "vmware-fusion" work for me in conjunction with vagrant. I use MacOS with M1 chip and it's just painful.

__Why Password Authentication?__

It's definitely not best practice and I wouldn't recommend you use this approach in a real VM, but I haven't found a way to authenticate via ssh key with docker as a provider since then.
