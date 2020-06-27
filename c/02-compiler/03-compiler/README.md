# Compiler

## 語法

```
PROG = STMTS
BLOCK = { STMTS }
STMTS = STMT*
STMT = WHILE | BLOCK | ASSIGN
WHILE = while (E) STMT
ASSIGN = id '=' E;
E = F (op E)*
F = (E) | Number | Id
```


## IF 的語法

```
//IF = if (E) STMT (else STMT)?
void IF(){
  int IFBegin = nextLabel();
  int End = nextLabel();
  skip("if");
  skip("(");
  int e = E();
  emit("if not t%d goto L%d\n", e, IFBegin);
  skip(")");
  STMT();
  emit("goto L%d\n", End);
  emit("(L%d)\n", IFBegin);
  if(isNext("else")){
    skip("else");
    STMT();
  }
  emit("(L%d)\n", End);
}
```
## 範例程式(hw.c)

```
a = 3;
b = 5;
if (a > b)
    t = a;
else
   t = b;
```

## 執行方法
```
在 03-compiler 開 terminal

執行 mingw32-make，看make能不能使用

執行 ./compiler.c test/hw.c
```
## 執行結果

```
PS D:\Desktop\110710540\sp\code\c\02-compiler\03-compiler>  ./compiler test/hw.c
a = 3;
b = 5;
if (a > b)
    t = a;
else
   t = b;
========== lex ==============
token=a
token==
token=3
token=;
token=b
token==
token=5
token=;
token=if
token=(
token=a
token=>
token=b
token=)
token=t
token==
token=a
token=;
token=else
token=t
token==
token=b
token=;
========== dump ==============
0:a
1:=
2:3
3:;
4:b
5:=
6:5
7:;
8:if
9:(
10:a
11:>
12:b
13:)
13:)
15:=
16:a
17:;
18:else
19:t
20:=
21:b
22:;
============ parse =============
t0 = 3
a = t0
t1 = 5
b = t1
t2 = a
t3 = b
t4 = t2 > t3
if not t4 goto L0
t5 = a
t = t5
goto L1
(L0)
t6 = b
t = t6
(L1)
```