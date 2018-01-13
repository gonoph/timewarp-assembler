.PHONY: all clean

ASFLAGS=--32
LDFLAGS=-m32

all: tw

clean:
	rm -r tw tw.o

tw.o: tw.s

tw: tw.o
	$(CC) $(LDFLAGS) -o $@ tw.s
