# Lab VM (Vagrant)

Use a disposable, isolated VM for OS/network exercises.

## Prereqs
- Install Vagrant and a provider (VirtualBox or VMware Fusion/Parallels with plugin).

## Start the VM
```sh path=null start=null
vagrant up
vagrant ssh
```
Network: NAT by default; do not bridge to the internet for course work.

## Snapshot / restore
```sh path=null start=null
vagrant snapshot save clean
vagrant snapshot restore clean
```

## Destroy
```sh path=null start=null
vagrant destroy -f
```
