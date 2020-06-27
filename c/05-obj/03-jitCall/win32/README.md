# Power

## 執行
```
PS D:\Desktop\110710540\sp\sp108b\c\05-obj\03-jitCall\win32> gcc .\JitCall.c -o power
PS D:\Desktop\110710540\sp\sp108b\c\05-obj\03-jitCall\win32> ./power
pow(2, 10)=1024
```

## 原理

```
PS D:\Desktop\110710540\sp\sp108b\c\05-obj\03-jitCall\win32\c> gcc -c power.c        
PS D:\Desktop\110710540\sp\sp108b\c\05-obj\03-jitCall\win32\c> objdump -d power.o    

power.o:     file format pe-i386


Disassembly of section .text:

00000000 <_power>:
   0:   55                      push   %ebp
   1:   89 e5                   mov    %esp,%ebp
   3:   83 ec 10                sub    $0x10,%esp
   6:   c7 45 fc 01 00 00 00    movl   $0x1,-0x4(%ebp)
   d:   eb 0e                   jmp    1d <_power+0x1d>
   f:   8b 45 08                mov    0x8(%ebp),%eax
  12:   0f af 45 08             imul   0x8(%ebp),%eax
  16:   89 45 08                mov    %eax,0x8(%ebp)
  19:   83 45 fc 01             addl   $0x1,-0x4(%ebp)
  1d:   8b 45 fc                mov    -0x4(%ebp),%eax
  20:   3b 45 0c                cmp    0xc(%ebp),%eax
  23:   7c ea                   jl     f <_power+0xf>
  25:   8b 45 08                mov    0x8(%ebp),%eax
  28:   c9                      leave
  29:   c3                      ret
  2a:   90                      nop
  2b:   90                      nop
```