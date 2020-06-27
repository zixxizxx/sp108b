## C 語言版組譯器的用法

```
PS D:\ccc\course\sp\code\c\03-asmVm\hack\c> make
gcc -std=c99 -O0 asm.c c6.c -o asm
gcc -std=c99 -O0 vm.c -o vm
PS D:\ccc\course\sp\code\c\03-asmVm\hack\c> ./asm ../test/Add
======= SYMBOL TABLE ===========
0: R0, 0
1: R1, 1
2: R2, 2
3: R3, 3
4: R4, 4
5: R5, 5
6: R6, 6
7: R7, 7
8: R8, 8
9: R9, 9
10: R10, 10
11: R11, 11
12: R12, 12
13: R13, 13
14: R14, 14
15: R15, 15
16: SCREEN, 16384
17: KBD, 24576
18: SP, 0
19: LCL, 1
20: ARG, 2
21: THIS, 3
22: THAT, 4
============= PASS1 ================
00:@2
01:D=A
02:@3
03:D=D+A
04:@0
05:M=D
======= SYMBOL TABLE ===========
0: R0, 0
1: R1, 1
2: R2, 2
3: R3, 3
4: R4, 4
5: R5, 5
6: R6, 6
7: R7, 7
8: R8, 8
9: R9, 9
10: R10, 10
11: R11, 11
12: R12, 12
13: R13, 13
14: R14, 14
15: R15, 15
16: SCREEN, 16384
17: KBD, 24576
18: SP, 0
19: LCL, 1
20: ARG, 2
21: THIS, 3
22: THAT, 4
============= PASS2 ================
  @2                   0000000000000010 0002
  D=A                  1110110000010000 ec10
  @3                   0000000000000011 0003
  D=D+A                1110000010010000 e090
  @0                   0000000000000000 0000
  M=D                  1110001100001000 e308
```


## HackCPU 虛擬機的用法


```
$ gcc asm.c c6.c -o asm
$ ./asm ../add/Add
```

上面的組譯器指令會產生 ../add/Add.bin 檔，於是我們可以用虛擬機執行該機器碼檔案！


```
PS D:\ccc\course\sp\code\c\03-asmVm\hack\c> ./vm ../test/Add.bin
PC=0000 I=0002 A=0001 D=0002 m[A]=0000
PC=0001 I=EC10 A=0002 D=0002 m[A]=0002 a=0 c=30 d=2 j=0
PC=0002 I=0003 A=0003 D=0003 m[A]=0002
PC=0003 I=E090 A=0004 D=0003 m[A]=0005 a=0 c=02 d=2 j=0
PC=0004 I=0000 A=0005 D=0000 m[A]=0005
PC=0005 I=E308 A=0006 D=0000 m[A]=0005 a=0 c=0C d=1 j=0
exit program !
```

## sum.asm

```
PS D:\ccc\course\sp\code\c\03-asmVm\hack\c> ./asm ../test/sum   
======= SYMBOL TABLE ===========
0: R0, 0
1: R1, 1
2: R2, 2
3: R3, 3
4: R4, 4
5: R5, 5
6: R6, 6
7: R7, 7
8: R8, 8
9: R9, 9
10: R10, 10
11: R11, 11
12: R12, 12
13: R13, 13
14: R14, 14
15: R15, 15
16: SCREEN, 16384
17: KBD, 24576
18: SP, 0
19: LCL, 1
20: ARG, 2
21: THIS, 3
22: THAT, 4
============= PASS1 ================
00:@10
01:D=A
02:@0
03:M=D
04:@i 
05:M=1
06:@sum
07:M=0
08:(LOOP)
  p.key=LOOP *p.value=8 top=24
08:@i 
09:D=M
10:@R0
11:D=D-M
12:@STOP
13:D;JGT
14:@i 
15:D=M
16:@sum
17:M=D+M
18:@i
19:M=M+1 
20:@LOOP
21:0;JMP
22:(STOP)
  p.key=STOP *p.value=22 top=25
22:@sum
23:D=M
24:@R1
25:M=D
======= SYMBOL TABLE ===========
0: R0, 0
1: R1, 1
2: R2, 2
3: R3, 3
4: R4, 4
5: R5, 5
6: R6, 6
7: R7, 7
8: R8, 8
9: R9, 9
10: R10, 10
11: R11, 11
12: R12, 12
13: R13, 13
14: R14, 14
15: R15, 15
16: SCREEN, 16384
17: KBD, 24576
18: SP, 0
19: LCL, 1
20: ARG, 2
21: THIS, 3
22: THAT, 4
23: LOOP, 8
24: STOP, 22
============= PASS2 ================
00: @10                  0000000000001010 000a
01: D=A                  1110110000010000 ec10
02: @0                   0000000000000000 0000
03: M=D                  1110001100001000 e308
  p.key=i *p.value=16 top=26
04: @i                   0000000000010000 0010
05: M=1                  1110111111001000 efc8
  p.key=sum *p.value=17 top=27
07: M=0                  1110101010001000 ea88
(LOOP)
08: @i                   0000000000010000 0010
09: D=M                  1111110000010000 fc10
0A: @R0                  0000000000000000 0000
0B: D=D-M                1111010011010000 f4d0
0C: @STOP                0000000000010110 0016
0D: D;JGT                1110001100000001 e301
0E: @i                   0000000000010000 0010
0F: D=M                  1111110000010000 fc10
10: @sum                 0000000000010001 0011
11: M=D+M                1111000010001000 f088
12: @i                   0000000000010000 0010
13: M=M+1                1111110111001000 fdc8
14: @LOOP                0000000000001000 0008
15: 0;JMP                1110101010000111 ea87
(STOP)
16: @sum                 0000000000010001 0011
17: D=M                  1111110000010000 fc10
18: @R1                  0000000000000001 0001
19: M=D                  1110001100001000 e308
```

以下的 0037 就是 55, 也就是 1+2+....+10 的結果!

```
PS D:\ccc\course\sp\code\c\03-asmVm\hack\c> ./vm ../test/sum.bin
PC=0000 I=000A A=000A D=0000 m[A]=0000
PC=0001 I=EC10 A=000A D=000A m[A]=0000 a=0 c=30 d=2 j=0
PC=0002 I=0000 A=0000 D=000A m[A]=0000
PC=0003 I=E308 A=0000 D=000A m[A]=000A a=0 c=0C d=1 j=0
PC=0004 I=0010 A=0010 D=000A m[A]=0000
PC=0005 I=EFC8 A=0010 D=000A m[A]=0001 a=0 c=3F d=1 j=0
PC=0006 I=0011 A=0011 D=000A m[A]=0000
PC=0007 I=EA88 A=0011 D=000A m[A]=0000 a=0 c=2A d=1 j=0
PC=0008 I=0010 A=0010 D=000A m[A]=0001
PC=0009 I=FC10 A=0010 D=0001 m[A]=0001 a=1 c=30 d=2 j=0
PC=000A I=0000 A=0000 D=0001 m[A]=000A
PC=000B I=F4D0 A=0000 D=FFFFFFF7 m[A]=000A a=1 c=13 d=2 j=0
PC=000C I=0016 A=0016 D=FFFFFFF7 m[A]=0000
PC=000D I=E301 A=0016 D=FFFFFFF7 m[A]=0000 a=0 c=0C d=0 j=1
PC=000E I=0010 A=0010 D=FFFFFFF7 m[A]=0001
PC=000F I=FC10 A=0010 D=0001 m[A]=0001 a=1 c=30 d=2 j=0
PC=0010 I=0011 A=0011 D=0001 m[A]=0000
PC=0011 I=F088 A=0011 D=0001 m[A]=0001 a=1 c=02 d=1 j=0
PC=0012 I=0010 A=0010 D=0001 m[A]=0001
PC=0013 I=FDC8 A=0010 D=0001 m[A]=0002 a=1 c=37 d=1 j=0
PC=0014 I=0008 A=0008 D=0001 m[A]=0000
PC=0015 I=EA87 A=0008 D=0001 m[A]=0000 a=0 c=2A d=0 j=7
PC=0008 I=0010 A=0010 D=0001 m[A]=0002
PC=0009 I=FC10 A=0010 D=0002 m[A]=0002 a=1 c=30 d=2 j=0
PC=000A I=0000 A=0000 D=0002 m[A]=000A
PC=000B I=F4D0 A=0000 D=FFFFFFF8 m[A]=000A a=1 c=13 d=2 j=0
PC=000C I=0016 A=0016 D=FFFFFFF8 m[A]=0000
PC=000D I=E301 A=0016 D=FFFFFFF8 m[A]=0000 a=0 c=0C d=0 j=1
PC=000E I=0010 A=0010 D=FFFFFFF8 m[A]=0002
PC=000F I=FC10 A=0010 D=0002 m[A]=0002 a=1 c=30 d=2 j=0
PC=0010 I=0011 A=0011 D=0002 m[A]=0001
PC=0011 I=F088 A=0011 D=0002 m[A]=0003 a=1 c=02 d=1 j=0
PC=0012 I=0010 A=0010 D=0002 m[A]=0002
PC=0013 I=FDC8 A=0010 D=0002 m[A]=0003 a=1 c=37 d=1 j=0
PC=0014 I=0008 A=0008 D=0002 m[A]=0000
PC=0015 I=EA87 A=0008 D=0002 m[A]=0000 a=0 c=2A d=0 j=7
PC=0008 I=0010 A=0010 D=0002 m[A]=0003
PC=0009 I=FC10 A=0010 D=0003 m[A]=0003 a=1 c=30 d=2 j=0
PC=000A I=0000 A=0000 D=0003 m[A]=000A
PC=000B I=F4D0 A=0000 D=FFFFFFF9 m[A]=000A a=1 c=13 d=2 j=0
PC=000C I=0016 A=0016 D=FFFFFFF9 m[A]=0000
PC=000D I=E301 A=0016 D=FFFFFFF9 m[A]=0000 a=0 c=0C d=0 j=1
PC=000E I=0010 A=0010 D=FFFFFFF9 m[A]=0003
PC=000F I=FC10 A=0010 D=0003 m[A]=0003 a=1 c=30 d=2 j=0
PC=0010 I=0011 A=0011 D=0003 m[A]=0003
PC=0011 I=F088 A=0011 D=0003 m[A]=0006 a=1 c=02 d=1 j=0
PC=0012 I=0010 A=0010 D=0003 m[A]=0003
PC=0013 I=FDC8 A=0010 D=0003 m[A]=0004 a=1 c=37 d=1 j=0
PC=0014 I=0008 A=0008 D=0003 m[A]=0000
PC=0015 I=EA87 A=0008 D=0003 m[A]=0000 a=0 c=2A d=0 j=7
PC=0008 I=0010 A=0010 D=0003 m[A]=0004
PC=0009 I=FC10 A=0010 D=0004 m[A]=0004 a=1 c=30 d=2 j=0
PC=000A I=0000 A=0000 D=0004 m[A]=000A
PC=000B I=F4D0 A=0000 D=FFFFFFFA m[A]=000A a=1 c=13 d=2 j=0
PC=000C I=0016 A=0016 D=FFFFFFFA m[A]=0000
PC=000D I=E301 A=0016 D=FFFFFFFA m[A]=0000 a=0 c=0C d=0 j=1
PC=000E I=0010 A=0010 D=FFFFFFFA m[A]=0004
PC=000F I=FC10 A=0010 D=0004 m[A]=0004 a=1 c=30 d=2 j=0
PC=0010 I=0011 A=0011 D=0004 m[A]=0006
PC=0011 I=F088 A=0011 D=0004 m[A]=000A a=1 c=02 d=1 j=0
PC=0012 I=0010 A=0010 D=0004 m[A]=0004
PC=0013 I=FDC8 A=0010 D=0004 m[A]=0005 a=1 c=37 d=1 j=0
PC=0014 I=0008 A=0008 D=0004 m[A]=0000
PC=0015 I=EA87 A=0008 D=0004 m[A]=0000 a=0 c=2A d=0 j=7
PC=0008 I=0010 A=0010 D=0004 m[A]=0005
PC=0009 I=FC10 A=0010 D=0005 m[A]=0005 a=1 c=30 d=2 j=0
PC=000A I=0000 A=0000 D=0005 m[A]=000A
PC=000B I=F4D0 A=0000 D=FFFFFFFB m[A]=000A a=1 c=13 d=2 j=0
PC=000C I=0016 A=0016 D=FFFFFFFB m[A]=0000
PC=000D I=E301 A=0016 D=FFFFFFFB m[A]=0000 a=0 c=0C d=0 j=1
PC=000E I=0010 A=0010 D=FFFFFFFB m[A]=0005
PC=000F I=FC10 A=0010 D=0005 m[A]=0005 a=1 c=30 d=2 j=0
PC=0010 I=0011 A=0011 D=0005 m[A]=000A
PC=0011 I=F088 A=0011 D=0005 m[A]=000F a=1 c=02 d=1 j=0
PC=0012 I=0010 A=0010 D=0005 m[A]=0005
PC=0013 I=FDC8 A=0010 D=0005 m[A]=0006 a=1 c=37 d=1 j=0
PC=0014 I=0008 A=0008 D=0005 m[A]=0000
PC=0015 I=EA87 A=0008 D=0005 m[A]=0000 a=0 c=2A d=0 j=7
PC=0008 I=0010 A=0010 D=0005 m[A]=0006
PC=0009 I=FC10 A=0010 D=0006 m[A]=0006 a=1 c=30 d=2 j=0
PC=000A I=0000 A=0000 D=0006 m[A]=000A
PC=000B I=F4D0 A=0000 D=FFFFFFFC m[A]=000A a=1 c=13 d=2 j=0
PC=000C I=0016 A=0016 D=FFFFFFFC m[A]=0000
PC=000D I=E301 A=0016 D=FFFFFFFC m[A]=0000 a=0 c=0C d=0 j=1
PC=000E I=0010 A=0010 D=FFFFFFFC m[A]=0006
PC=000F I=FC10 A=0010 D=0006 m[A]=0006 a=1 c=30 d=2 j=0
PC=0010 I=0011 A=0011 D=0006 m[A]=000F
PC=0011 I=F088 A=0011 D=0006 m[A]=0015 a=1 c=02 d=1 j=0
PC=0012 I=0010 A=0010 D=0006 m[A]=0006
PC=0013 I=FDC8 A=0010 D=0006 m[A]=0007 a=1 c=37 d=1 j=0
PC=0014 I=0008 A=0008 D=0006 m[A]=0000
PC=0015 I=EA87 A=0008 D=0006 m[A]=0000 a=0 c=2A d=0 j=7
PC=0008 I=0010 A=0010 D=0006 m[A]=0007
PC=0009 I=FC10 A=0010 D=0007 m[A]=0007 a=1 c=30 d=2 j=0
PC=000A I=0000 A=0000 D=0007 m[A]=000A
PC=000B I=F4D0 A=0000 D=FFFFFFFD m[A]=000A a=1 c=13 d=2 j=0
PC=000C I=0016 A=0016 D=FFFFFFFD m[A]=0000
PC=000D I=E301 A=0016 D=FFFFFFFD m[A]=0000 a=0 c=0C d=0 j=1
PC=000E I=0010 A=0010 D=FFFFFFFD m[A]=0007
PC=000F I=FC10 A=0010 D=0007 m[A]=0007 a=1 c=30 d=2 j=0
PC=0010 I=0011 A=0011 D=0007 m[A]=0015
PC=0011 I=F088 A=0011 D=0007 m[A]=001C a=1 c=02 d=1 j=0
PC=0012 I=0010 A=0010 D=0007 m[A]=0007
PC=0013 I=FDC8 A=0010 D=0007 m[A]=0008 a=1 c=37 d=1 j=0
PC=0014 I=0008 A=0008 D=0007 m[A]=0000
PC=0015 I=EA87 A=0008 D=0007 m[A]=0000 a=0 c=2A d=0 j=7
PC=0008 I=0010 A=0010 D=0007 m[A]=0008
PC=0009 I=FC10 A=0010 D=0008 m[A]=0008 a=1 c=30 d=2 j=0
PC=000A I=0000 A=0000 D=0008 m[A]=000A
PC=000B I=F4D0 A=0000 D=FFFFFFFE m[A]=000A a=1 c=13 d=2 j=0
PC=000C I=0016 A=0016 D=FFFFFFFE m[A]=0000
PC=000D I=E301 A=0016 D=FFFFFFFE m[A]=0000 a=0 c=0C d=0 j=1
PC=000E I=0010 A=0010 D=FFFFFFFE m[A]=0008
PC=000F I=FC10 A=0010 D=0008 m[A]=0008 a=1 c=30 d=2 j=0
PC=0010 I=0011 A=0011 D=0008 m[A]=001C
PC=0011 I=F088 A=0011 D=0008 m[A]=0024 a=1 c=02 d=1 j=0
PC=0012 I=0010 A=0010 D=0008 m[A]=0008
PC=0013 I=FDC8 A=0010 D=0008 m[A]=0009 a=1 c=37 d=1 j=0
PC=0014 I=0008 A=0008 D=0008 m[A]=0000
PC=0015 I=EA87 A=0008 D=0008 m[A]=0000 a=0 c=2A d=0 j=7
PC=0008 I=0010 A=0010 D=0008 m[A]=0009
PC=0009 I=FC10 A=0010 D=0009 m[A]=0009 a=1 c=30 d=2 j=0
PC=000A I=0000 A=0000 D=0009 m[A]=000A
PC=000B I=F4D0 A=0000 D=FFFFFFFF m[A]=000A a=1 c=13 d=2 j=0
PC=000C I=0016 A=0016 D=FFFFFFFF m[A]=0000
PC=000D I=E301 A=0016 D=FFFFFFFF m[A]=0000 a=0 c=0C d=0 j=1
PC=000E I=0010 A=0010 D=FFFFFFFF m[A]=0009
PC=000F I=FC10 A=0010 D=0009 m[A]=0009 a=1 c=30 d=2 j=0
PC=0010 I=0011 A=0011 D=0009 m[A]=0024
PC=0011 I=F088 A=0011 D=0009 m[A]=002D a=1 c=02 d=1 j=0
PC=0012 I=0010 A=0010 D=0009 m[A]=0009
PC=0013 I=FDC8 A=0010 D=0009 m[A]=000A a=1 c=37 d=1 j=0
PC=0014 I=0008 A=0008 D=0009 m[A]=0000
PC=0015 I=EA87 A=0008 D=0009 m[A]=0000 a=0 c=2A d=0 j=7
PC=0008 I=0010 A=0010 D=0009 m[A]=000A
PC=0009 I=FC10 A=0010 D=000A m[A]=000A a=1 c=30 d=2 j=0
PC=000A I=0000 A=0000 D=000A m[A]=000A
PC=000B I=F4D0 A=0000 D=0000 m[A]=000A a=1 c=13 d=2 j=0
PC=000C I=0016 A=0016 D=0000 m[A]=0000
PC=000D I=E301 A=0016 D=0000 m[A]=0000 a=0 c=0C d=0 j=1
PC=000E I=0010 A=0010 D=0000 m[A]=000A
PC=000F I=FC10 A=0010 D=000A m[A]=000A a=1 c=30 d=2 j=0
PC=0010 I=0011 A=0011 D=000A m[A]=002D
PC=0011 I=F088 A=0011 D=000A m[A]=0037 a=1 c=02 d=1 j=0
PC=0012 I=0010 A=0010 D=000A m[A]=000A
PC=0013 I=FDC8 A=0010 D=000A m[A]=000B a=1 c=37 d=1 j=0
PC=0014 I=0008 A=0008 D=000A m[A]=0000
PC=0015 I=EA87 A=0008 D=000A m[A]=0000 a=0 c=2A d=0 j=7
PC=0008 I=0010 A=0010 D=000A m[A]=000B
PC=0009 I=FC10 A=0010 D=000B m[A]=000B a=1 c=30 d=2 j=0
PC=000A I=0000 A=0000 D=000B m[A]=000A
PC=000B I=F4D0 A=0000 D=0001 m[A]=000A a=1 c=13 d=2 j=0
PC=000C I=0016 A=0016 D=0001 m[A]=0000
PC=000D I=E301 A=0016 D=0001 m[A]=0000 a=0 c=0C d=0 j=1
PC=0016 I=0011 A=0011 D=0001 m[A]=0037
PC=0017 I=FC10 A=0011 D=0037 m[A]=0037 a=1 c=30 d=2 j=0
PC=0018 I=0001 A=0001 D=0037 m[A]=0000
PC=0019 I=E308 A=0001 D=0037 m[A]=0037 a=0 c=0C d=1 j=0
exit program !
```