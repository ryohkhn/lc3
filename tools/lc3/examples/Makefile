LC3AS?=../lc3as
TARGETS=$(subst .asm,.obj,$(wildcard *.asm)) hanoi.out

.PHONY: all clean

all: $(TARGETS)

clean:
	rm -f *.{obj,sym}

%.obj %.sym: %.asm
	$(LC3AS) $<

%.out: %.c
	$(CC) -g -Wall -pedantic -fsanitize=undefined -o $@ $<
