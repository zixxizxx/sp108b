# x86 64 位元版組合語言

* [X86 CPU 暫存器 Register 大全](https://finalfrank.pixnet.net/blog/post/22992166-x86-cpu-%E6%9A%AB%E5%AD%98%E5%99%A8-register-%E5%A4%A7%E5%85%A8)
* [X86組合語言](https://zh.m.wikibooks.org/wiki/X86%E7%B5%84%E5%90%88%E8%AA%9E%E8%A8%80)
    * [X86組合語言/X86架構及暫存器解釋](https://zh.m.wikibooks.org/zh-tw/X86%E7%B5%84%E5%90%88%E8%AA%9E%E8%A8%80/X86%E6%9E%B6%E6%9E%84%E5%8F%8A%E5%AF%84%E5%AD%98%E5%99%A8%E8%A7%A3%E9%87%8A)
* [個人的 x86 組合語言觀念筆記](https://www.ptt.cc/bbs/ASM/M.1286960542.A.5B9.html)

## windows

* [hello world, C and GNU as](https://www.chocolatesparalucia.com/2010/09/hello-world-c-and-gnu-as/)

```
as -o hello.o hello.s

ld -o hello.exe
/mingw/lib/crt2.o
C:/MinGW/bin/../lib/gcc/mingw32/3.4.5/crtbegin.o
-LC:/MinGW/bin/../lib/gcc/mingw32/3.4.5
-LC:/MinGW/lib hello.o
-lmingw32 -lgcc -lmsvcrt -lkernel32
C:/MinGW/bin/../lib/gcc/mingw32/3.4.5/crtend.o
```

But it’s better to just type gcc -o hello.exe hello.s 

* https://en.wikibooks.org/wiki/X86_Assembly/GAS_Syntax#Communicating_directly_with_the_operating_system
* https://en.wikipedia.org/wiki/X86-64


## Linux

學習 -- http://cs.lmu.edu/~ray/notes/gasexamples/

參考 -- https://eli.thegreenplace.net/2011/09/06/stack-frame-layout-on-x86-64/

這些範例必須在 Linux 下執行， windows 與 mac 不行！

