# pacman 套件管理員

pacman 是 archlinux 的套件管理員，msys2 也使用了 pacman 作為套件管理員。

網站版 pacman -- https://www.archlinux.org/packages/

## 注意：特別注意！

在 msys2 當中有很多套件，像是 glib2 等等，都有很多版本，例如以下列出的 pacman -Ss glib2 就有 msys/glib2 與 mingw64/mingw-w64-x86_64-glib2 等區分。

我發現 mingw-w64-x86_64-*** 這版才能正確運作，msys/glib2 不會安裝到 mingw64 資料夾下，而且會導致 pkg-config 找不到 glib.h 的位置。

* [請看正確示範](glib2.md)

但奇怪的是，安裝一般程式 (exe) 時，必須使用沒有 mingw-w64-x86_64- 開頭的版本，這樣才會放入 bin 裏可以執行，所以 pkg-config 必須使用

```
$ pacman -S pkg-config
```

最後我的推論是： 想要執行檔裝普通版 msys ，想要和平台有關的引用檔就裝對應平台的 mingw64/mingw-w64-x86_64-* (64 位元) mingw32/mingw-w64-i686-* (32 位元版)

這樣才能正確運作！

## pacman 指令

```
$ pacman -S xxx           // 安裝 xxx 套件
$ pacman -Ss xxx          // 搜尋含有關鍵字 xxx 的套件
$ pacman -R xxx           // 移除 xxx 套件
$ pacman -Q               // 列出所有安裝套件
$ pacman -Qi xxx          // 列出 xxx 套件的詳細資訊。
```

## 正確示範 : glib 的範例

安裝完 pkg-config 與 mingw-w64-x86_64-glib2 之後，就能正確編譯執行 03-glib 下的程式了。

```
Tim@DESKTOP-QOC5V2F MINGW64 /d/ccc/sp/code/c/06-os1windows/03-msys2/04-pacman/03-glib
$ make
gcc glist.c -o glist `pkg-config --cflags glib-2.0` -g -Wall -std=gnu11 -O3 `pkg-config --libs glib-2.0`
gcc gslist.c -o gslist `pkg-config --cflags glib-2.0` -g -Wall -std=gnu11 -O3 `pkg-config --libs glib-2.0`
gcc htable.c -o htable `pkg-config --cflags glib-2.0` -g -Wall -std=gnu11 -O3 `pkg-config --libs glib-2.0`

Tim@DESKTOP-QOC5V2F MINGW64 /d/ccc/sp/code/c/06-os1windows/03-msys2/04-pacman/03-glib
$ ./glist
a
b
c
The list is now 0 items long

Tim@DESKTOP-QOC5V2F MINGW64 /d/ccc/sp/code/c/06-os1windows/03-msys2/04-pacman/03-glib
$ ./gslist
The list is now 0 items long
The list is now 2 items long

Tim@DESKTOP-QOC5V2F MINGW64 /d/ccc/sp/code/c/06-os1windows/03-msys2/04-pacman/03-glib
$ ./htable
There are 2 keys in the hash table
Jazzy likes Cheese

```

