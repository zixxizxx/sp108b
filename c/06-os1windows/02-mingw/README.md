# MinGW

* https://en.wikipedia.org/wiki/MinGW

摘要: MinGW 只支援部分 Posix API. (不支援 fork, mmap, ioctl, ....) 

Although both Cygwin and MinGW can be used to port Unix software to Windows, they have different approaches:[19] Cygwin aims to provide a complete POSIX layer comprising a full implementation of all major Unix system calls and libraries. Compatibility is considered higher priority than performance. On the other hand, MinGW's priorities are simplicity and performance. As such, it does not provide certain POSIX APIs which cannot easily be implemented using the Windows API, such as fork(), mmap() and ioctl().[19] Applications written using a cross-platform library that has itself been ported to MinGW, such as SDL, wxWidgets, Qt, or GTK, will usually compile as easily in MinGW as they would in Cygwin.

