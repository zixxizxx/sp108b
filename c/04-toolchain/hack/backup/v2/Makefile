CC := gcc
CFLAGS = -std=c99 -O0 -Wall 
ALL = ma cc as vm
BIN = bin
LIB = lib/util.c lib/map.c lib/strTable.c

.PHONY: $(ALL)

all: $(ALL)

cc: cc/cc.c cc/lexer.c cc/compiler.c ir/ir.c ir/irvm.c ir/ir2m.c $(LIB)
	$(CC) $(CFLAGS) $^ -o $(BIN)/$@

as: as/asm.c $(LIB)
	$(CC) $(CFLAGS) $^ -o $(BIN)/$@

vm: vm/vm.c $(LIB)
	$(CC) $(CFLAGS) $^ -o $(BIN)/$@

ma: ma/macro.c $(LIB)
	$(CC) $(CFLAGS) $^ -o $(BIN)/$@

cRun: 
	$(BIN)/cc test/c/$(file)
	$(BIN)/ma test/c/$(file).mx -o ../test/c/$(file).sx
	$(BIN)/as test/c/$(file)
	$(BIN)/vm test/c/$(file).ox -d

c2ir:
	$(BIN)/cc test/c/$(file) -d

mRun: 
	$(BIN)/ma test/m/$(file).mx -o ../test/m/$(file).sx
	$(BIN)/as test/m/$(file)
	$(BIN)/vm test/m/$(file).ox

sRun: 
	$(BIN)/as test/s/$(file)
	$(BIN)/vm test/s/$(file).ox -d

oRun: 
	$(BIN)/vm test/m/$(file).ox

oDebug: 
	$(BIN)/vm test/m/$(file).ox -d

clean:
	rm -f $(BIN)/*.o $(BIN)/*.exe
