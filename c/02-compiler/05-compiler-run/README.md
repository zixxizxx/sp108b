# 05-compiler-run 加上 IF 的語法

## IF 的語法

```
//IF = if (E) STMT (else STMT)?
void IF() {
  int ifBegin = nextLabel();
  int ifEnd = nextLabel();
  skip("if");
  skip("(");
  int e = E();
  irEmitIfNotGoto(e, ifBegin);
  //emit("if not T%d goto L%d\n", e, ifBegin);
  skip(")");
  STMT();
  irEmitGoto(ifEnd);
  //emit("goto L%d\n", ifEnd);
  irEmitLabel(ifBegin);
  //emit("(L%d)\n", ifBegin);
  if(isNext("else")){
    skip("else");
    STMT();
  }
  irEmitLabel(ifEnd);
  //emit("(L%d)\n", ifEnd);
}
```
##範例程式(hw.c)

```
a = 3;
b = 5;
if (a > b)
    t = a;
else
   t = b;
```

##執行方法
```
在 05-compiler-run  開 terminal

執行 mingw32-make，看make能不能使用

執行 ./compiler.c test/if.c -run
```
## 執行結果