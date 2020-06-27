CC := gcc
CFLAGS = -std=c99 -O0
TARGET = asm vm

all: $(TARGET)

hack2x86: hack2x86.c
	$(CC) $(CFLAGS) $^ -o $@

vm: 
	$(CC) $(CFLAGS) $^ -o $@

clean:
	rm -f *.o *.exe
