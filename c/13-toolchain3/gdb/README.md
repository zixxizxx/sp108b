## 使用 gdb


參考 : https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/gdb.html

圖形版: DDD -- https://www.gnu.org/software/ddd/

## windows

```
PS D:\ccc\sp\code\c\04-toolchain\gcc\07-gdb> gcc main.c add.c 
-o add -g
PS D:\ccc\sp\code\c\04-toolchain\gcc\07-gdb> gdb32 -q add     
Reading symbols from add...done.
(gdb) break 6
Breakpoint 1 at 0x40135e: file main.c, line 6.
(gdb) r
Starting program: D:\ccc\sp\code\c\04-toolchain\gcc\07-gdb\add.exe 
[New Thread 5800.0x21e8]

Breakpoint 1, main () at main.c:6
6         int t = add(5, 8);
(gdb) n
7         printf("add(5, 8)=%d\n", t);
(gdb) n
[New Thread 5800.0x3fc]
add(5, 8)=13
8         return 0;
(gdb) n
9       }(gdb) n
0x004010fd in __mingw_CRTStartup ()
(gdb) n
Single stepping until exit from function __mingw_CRTStartup,  
which has no line number information.
[Inferior 1 (process 5800) exited normally]
(gdb) quit
```
