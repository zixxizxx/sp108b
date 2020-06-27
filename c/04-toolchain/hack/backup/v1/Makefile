CC := gcc
CFLAGS = -std=c99 -O0 -Wall 
ALL = as vm
BIN = bin
LIB = lib/util.c lib/map.c lib/strTable.c

.PHONY: $(ALL)

all: $(ALL)

as: as/asm.c $(LIB)
	$(CC) $(CFLAGS) $^ -o $(BIN)/$@

vm: vm/vm.c $(LIB)
	$(CC) $(CFLAGS) $^ -o $(BIN)/$@

sRun: 
	$(BIN)/as test/s/$(file)
	$(BIN)/vm test/s/$(file).ox -d

oRun: 
	$(BIN)/vm test/m/$(file).ox -d

clean:
	rm -f $(BIN)/*.o $(BIN)/*.exe
