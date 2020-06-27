# Mini-ARM-os

* https://github.com/jserv/mini-arm-os
* [用十分鐘 向jserv學習作業系統設計](https://www.slideshare.net/ccckmit/jserv)

## 安裝

* https://github.com/jserv/mini-arm-os

* https://unix.stackexchange.com/questions/453032/how-to-install-a-functional-arm-cross-gcc-toolchain-on-ubuntu-18-04-bionic-beav



```
sudo apt remove gcc-arm-none-eabi
sudo apt-add-repository ppa:team-gcc-arm-embedded/ppa
sudo apt update
[...] Ign:4 http://ppa.launchpad.net/team-gcc-arm-embedded/ppa/ubuntu bionic InRelease
Get:5 http://security.ubuntu.com/ubuntu bionic-security InRelease [83.2 kB]
Err:6 http://ppa.launchpad.net/team-gcc-arm-embedded/ppa/ubuntu bionic Release
404 Not Found [IP: 91.189.95.83 80]
Reading package lists... Done
E: The repository 'http://ppa.launchpad.net/team-gcc-arm-embedded/ppa/ubuntu bionic Release' does not have a Release file.
N: Updating from such a repository can't be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.
sudo apt-install gcc-arm-embedded
```


```
root@localhost:/home/guest/spMore/qemu_stm32# ./configure --disable-werror --enable-debug \
>     --target-list="arm-softmmu" \
>     --extra-cflags=-DSTM32_UART_NO_BAUD_DELAY \
>     --extra-cflags=-DSTM32_UART_ENABLE_OVERRUN \
>     --disable-gtk
Disabling libtool due to broken toolchain support

ERROR: DTC (libfdt) not present. Your options:
         (1) Preferred: Install the DTC (libfdt) devel package
         (2) Fetch the DTC submodule, using:
             git submodule update --init dtc

root@localhost:/home/guest/spMore/qemu_stm32# git submodule update --init dtc
Submodule 'dtc' (git://git.qemu-project.org/dtc.git) registered for path 'dtc'
Cloning into '/home/guest/spMore/qemu_stm32/dtc'...
Submodule path 'dtc': checked out 'bc895d6d09695d05ceb8b52486ffe861d6cfbdde'
root@localhost:/home/guest/spMore/qemu_stm32# ./configure --disable-werror --enable-debug \
>     --target-list="arm-softmmu" \
>     --extra-cflags=-DSTM32_UART_NO_BAUD_DELAY \
>     --extra-cflags=-DSTM32_UART_ENABLE_OVERRUN \
>     --disable-gtk
Disabling libtool due to broken toolchain support
Install prefix    /usr/local
BIOS directory    /usr/local/share/qemu
binary directory  /usr/local/bin
library directory /usr/local/lib
module directory  /usr/local/lib/qemu
libexec directory /usr/local/libexec
include directory /usr/local/include
config directory  /usr/local/etc
local state directory   /usr/local/var
Manual directory  /usr/local/share/man
ELF interp prefix /usr/gnemul/qemu-%M
Source path       /home/guest/spMore/qemu_stm32
C compiler        cc
Host C compiler   cc
C++ compiler      c++
Objective-C compiler cc
ARFLAGS           rv
CFLAGS            -pthread -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -g
QEMU_CFLAGS       -fPIE -DPIE -m64 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wall -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -DSTM32_UART_ENABLE_OVERRUN -DSTM32_UART_NO_BAUD_DELAY  -Wendif-labels -Wmissing-include-dirs -Wempty-body -Wnested-externs -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wold-style-declaration -Wold-style-definition -Wtype-limits -fstack-protector-strong -I/usr/include/libusb-1.0 -I/usr/include/pixman-1 -I$(SRC_PATH)/dtc/libfdt
LDFLAGS           -Wl,--warn-common -Wl,-z,relro -Wl,-z,now -pie -m64 -g
make              make
install           install
python            python -B
smbd              /usr/sbin/smbd
module support    no
host CPU          x86_64
host big endian   no
target list       arm-softmmu
tcg debug enabled yes
gprof enabled     no
sparse enabled    no
strip binaries    no
profiler          no
static build      no
pixman            system
SDL support       no
GTK support       no
VTE support       no
curses support    no
curl support      no
mingw32 support   no
Audio drivers     oss
Block whitelist (rw)
Block whitelist (ro)
VirtFS support    no
VNC support       yes
VNC TLS support   no
VNC SASL support  no
VNC JPEG support  no
VNC PNG support   no
VNC WS support    no
xen support       no
brlapi support    no
bluez  support    no
Documentation     yes
GUEST_BASE        yes
PIE               yes
vde support       no
netmap support    no
Linux AIO support no
ATTR/XATTR support yes
Install blobs     yes
KVM support       yes
RDMA support      no
TCG interpreter   no
fdt support       yes
preadv support    yes
fdatasync         yes
madvise           yes
posix_madvise     yes
sigev_thread_id   yes
uuid support      no
libcap-ng support no
vhost-net support yes
vhost-scsi support yes
Trace backends    nop
spice support     no
rbd support       no
xfsctl support    no
nss used          no
libusb            yes
usb net redir     no
GLX support       no
libiscsi support  no
libnfs support    no
build guest agent yes
QGA VSS support   no
seccomp support   no
coroutine backend ucontext
coroutine pool    yes
GlusterFS support no
virtio-blk-data-plane no
gcov              gcov
gcov enabled      no
TPM support       yes
libssh2 support   no
TPM passthrough   yes
QOM debugging     yes
vhdx              no
Quorum            no
lzo support       no
snappy support    no
NUMA host support yes

```


```
root@localhost:/home/guest/spMore/mini-arm-os/00-HelloWorld# make qemu
/bin/sh: 1: qemu-system-arm: not found
Makefile:16: recipe for target 'qemu' failed
make: *** [qemu] Error 1
root@localhost:/home/guest/spMore/mini-arm-os/00-HelloWorld# qemu-system-arm

Command 'qemu-system-arm' not found, but can be installed with:

apt install qemu-system-arm

root@localhost:/home/guest/spMore/mini-arm-os/00-HelloWorld# apt isntall qemu-system-arm
E: Invalid operation isntall
root@localhost:/home/guest/spMore/mini-arm-os/00-HelloWorld# apt install qemu-system-arm
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following packages were automatically installed and are no longer required:
  cpp-7-riscv64-linux-gnu cpp-riscv64-linux-gnu gcc-7-cross-base-ports
  gcc-7-riscv64-linux-gnu-base gcc-8-cross-base-ports libatomic1-riscv64-cross
  libc6-dev-riscv64-cross libc6-riscv64-cross libgcc-7-dev-riscv64-cross
  libgcc1-riscv64-cross libgomp1-riscv64-cross linux-libc-dev-riscv64-cross
Use 'apt autoremove' to remove them.
The following additional packages will be installed:
  ipxe-qemu-256k-compat-efi-roms
Suggested packages:
  samba vde2 qemu-block-extra qemu-efi
The following NEW packages will be installed:
  ipxe-qemu-256k-compat-efi-roms qemu-system-arm
0 upgraded, 2 newly installed, 0 to remove and 323 not upgraded.
Need to get 6,187 kB of archives.
After this operation, 26.3 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://mirrors.linode.com/ubuntu bionic/main amd64 ipxe-qemu-256k-compat-efi-roms all 1.0.0+git-20150424.a25a16d-0ubuntu2 [545 kB]
Get:2 http://mirrors.linode.com/ubuntu bionic-updates/main amd64 qemu-system-arm amd64 1:2.11+dfsg-1ubuntu7.23 [5,643 kB]
Fetched 6,187 kB in 0s (49.5 MB/s)
Selecting previously unselected package ipxe-qemu-256k-compat-efi-roms.
(Reading database ... 157562 files and directories currently installed.)
Preparing to unpack .../ipxe-qemu-256k-compat-efi-roms_1.0.0+git-20150424.a25a16d-0ubuntu2_all.deb ...
Unpacking ipxe-qemu-256k-compat-efi-roms (1.0.0+git-20150424.a25a16d-0ubuntu2) ...
Selecting previously unselected package qemu-system-arm.
Preparing to unpack .../qemu-system-arm_1%3a2.11+dfsg-1ubuntu7.23_amd64.deb ...
Unpacking qemu-system-arm (1:2.11+dfsg-1ubuntu7.23) ...
Setting up qemu-system-arm (1:2.11+dfsg-1ubuntu7.23) ...
Setting up ipxe-qemu-256k-compat-efi-roms (1.0.0+git-20150424.a25a16d-0ubuntu2) ...
Processing triggers for man-db (2.8.3-2) ...

```