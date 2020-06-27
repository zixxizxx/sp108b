# 01-hello

```
PS D:\ccc\course\sp\code\c\03-asmVm\asm\windows\01-hello> gcc -c hello.s -o hello.o

PS D:\ccc\course\sp\code\c\03-asmVm\asm\windows\01-hello> ld -e go hello.o -L "C:\Program Files (x86)\CodeBlocks\MinGW\lib" -lkernel32
PS D:\ccc\course\sp\code\c\03-asmVm\asm\windows\01-hello> ./a
Hello, World
```