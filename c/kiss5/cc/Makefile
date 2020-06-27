CC = gcc
CFLAGS = -Wall -std=gnu99
TARGET = cc vm objdump
all: $(TARGET)

cc: cc.c
	$(CC) -D__CC__ $(CFLAGS) -o $@ $< $(LDFLAGS)

vm: cc.c
	$(CC) -D__VM__ $(CFLAGS) -o $@ $< $(LDFLAGS)

objdump: cc.c
	$(CC) -D__OBJDUMP__ $(CFLAGS) -o $@ $< $(LDFLAGS)

clean:
	$(RM) $(TARGET)

wclean:
	del *.exe
