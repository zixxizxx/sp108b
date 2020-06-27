# c7 -- 將 C 語言編譯為堆疊機 vm 的目的檔格式

c7 是一個可自我編譯的極簡版 C 語言編譯器，由陳鍾誠修改自 c4 專案。

c4 專案的來源為 -- https://github.com/rswier/c4 。

陳鍾誠修改之處:

改成四個檔案 cc.c, cc.h, objdump.c, vm.c

1. 加上中文註解
2. 讓函數更模組化，例如增加虛擬機函數 vm_run(), 不受現在只有 4 個函數。
3. 讓虛擬機的 JMP, BZ, BNZ 等指令改為相對 PC 定址，而不是絕對定址，這樣可以有助於產生比較少修改紀錄的目的檔。
4. 加入 WRITE, MCPY 系統呼叫。
5. 可以指定 cc -o `path` 輸出虛擬機目的檔。
6. 可以用 vm `objfile` 載入目的檔然後執行之。

## 建置執行

```
PS D:\ccc\course\sp\code\c\x7\c7> make
gcc -D__CC__ -Wall -std=gnu99 -o cc cc.c 
gcc -D__OBJDUMP__ -Wall -std=gnu99 -o objdump cc.c 
PS D:\ccc\course\sp\code\c\x7\c7> ./cc cc.c test/sum.c
exit(11) cycle = 302
exit(0) cycle = 105682
PS D:\ccc\course\sp\code\c\x7\c7> ./cc -o test/sum.o test/sum.c
---------obj_save()-------------
header: entry=56

          Size      VMA      LMA   Offset
code: 00000124 00C10050 00C10050 00000040
data: 0000000C 00C50058 00C50058 00000164
relo: 00000010 00CD0068 00CD0068 00000170
stab: 000000C4 00C90060 00C90060 00000180
symt: 00000010 00BD0048 00BD0048 00000244
PS D:\ccc\course\sp\code\c\x7\c7> ./vm test/sum.o
sum(10)=55
exit(11) cycle = 302
PS D:\ccc\course\sp\code\c\x7\c7> ./objdump test/sum.o
---------obj_dump()-------------
header: entry=56

          Size      VMA      LMA   Offset
code: 00000124 00C10050 006F0088 00000040
data: 0000000C 00C50058 006F01AC 00000164
relo: 00000010 00CD0068 006F01B8 00000170
stab: 000000C4 00C90060 006F01C8 00000180
symt: 00000010 00BD0048 006F028C 00000244

Symbol Table:
    Name    Type
    main     Fun
```
