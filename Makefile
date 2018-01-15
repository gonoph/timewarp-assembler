.PHONY: all clean

# DEBUG=-ggdb
ASFLAGS=--32 $(DEBUG)
LDFLAGS=-m elf_i386

all: tw

clean:
	rm -r tw tw.o

tw.o: tw.s

tw: tw.o
	$(LD) $(LDFLAGS) -o $@ tw.o
