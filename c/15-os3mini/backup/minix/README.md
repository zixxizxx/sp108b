# MINIX


## 安裝

* 使用 qemu-kvm : https://wiki.minix3.org/doku.php?id=usersguide:runningonqemu


```
root@localhost:/home/guest/spMore/minix# wget "http://download.minix3.org/iso/minix_R3.3.0-588a35b.iso.bz2"
--2020-04-21 04:51:47--  http://download.minix3.org/iso/minix_R3.3.0-588a35b.iso.bz2
Resolving download.minix3.org (download.minix3.org)... 66.147.238.215
Connecting to download.minix3.org (download.minix3.org)|66.147.238.215|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 301656556 (288M) [application/octet-stream]
Saving to: ‘minix_R3.3.0-588a35b.iso.bz2’

minix_R3.3.0-588a35 100%[===================>] 287.68M  9.53MB/s    in 31s

2020-04-21 04:52:21 (9.21 MB/s) - ‘minix_R3.3.0-588a35b.iso.bz2’ saved [301656556/301656556]

root@localhost:/home/guest/spMore/minix# ls
minix_R3.3.0-588a35b.iso.bz2
root@localhost:/home/guest/spMore/minix# bzip2 -d minix_R3.3.0-588a35b.iso.bz2

root@localhost:/home/guest/spMore/minix#
root@localhost:/home/guest/spMore/minix# ls
minix_R3.3.0-588a35b.iso
root@localhost:/home/guest/spMore/minix# qemu-img create minix.img 8G
Formatting 'minix.img', fmt=raw size=8589934592
root@localhost:/home/guest/spMore/minix# ls
minix.img  minix_R3.3.0-588a35b.iso
root@localhost:/home/guest/spMore/minix# qemu -localtime -net user -net nic -m 256 -cdrom minix.iso -hda minix_R3.3.0-599a35b.img -boot d

Command 'qemu' not found, did you mean:

  command 'nemu' from snap nemu (a51c604)
  command 'aqemu' from deb aqemu

See 'snap info <snapname>' for additional versions.

root@localhost:/home/guest/spMore/minix# kvm

Command 'kvm' not found, but can be installed with:

apt install qemu-kvm

root@localhost:/home/guest/spMore/minix# apt install qemu-kvm
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following packages were automatically installed and are no longer required:
  cpp-7-riscv64-linux-gnu cpp-riscv64-linux-gnu gcc-7-cross-base-ports
  gcc-7-riscv64-linux-gnu-base gcc-8-cross-base-ports libatomic1-riscv64-cross
  libc6-dev-riscv64-cross libc6-riscv64-cross libgcc-7-dev-riscv64-cross
  libgcc1-riscv64-cross libgomp1-riscv64-cross linux-libc-dev-riscv64-cross
Use 'apt autoremove' to remove them.
The following NEW packages will be installed:
  qemu-kvm
0 upgraded, 1 newly installed, 0 to remove and 323 not upgraded.
Need to get 13.2 kB of archives.
After this operation, 122 kB of additional disk space will be used.
Get:1 http://mirrors.linode.com/ubuntu bionic-updates/main amd64 qemu-kvm amd64 1:2.11+dfsg-1ubuntu7.23 [13.2 kB]
Fetched 13.2 kB in 0s (1,270 kB/s)
Selecting previously unselected package qemu-kvm.
(Reading database ... 157694 files and directories currently installed.)
Preparing to unpack .../qemu-kvm_1%3a2.11+dfsg-1ubuntu7.23_amd64.deb ...
Unpacking qemu-kvm (1:2.11+dfsg-1ubuntu7.23) ...
Setting up qemu-kvm (1:2.11+dfsg-1ubuntu7.23) ...
Processing triggers for man-db (2.8.3-2) ...

```
