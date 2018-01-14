.PHONY: all clean

LDFLAGS=-m32

all: tw

clean:
	rm -r tw

tw: tw.s
	gcc $(LDFLAGS) -o $@ tw.s
