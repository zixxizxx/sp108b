# Link Script

參考《程式設計師的自我修養》  4.6.3 (127頁)

## 直接編譯連結執行

```
$ gcc -c -fno-builtin tinyHello.c
$ ld -static -e mymain -o tinyHello tinyHello.o
$ ./tinyHello

```

## 使用 linkScript 連結執行

```
$ gcc -c -fno-builtin tinyHello.c
$ ld -static -T tinyHello.lds -o tinyHello tinyHello.o
```
