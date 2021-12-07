export GOARCH:= arm64
export GOOS:= linux
ARCH:= aarch64
TARGET:= $(ARCH)-$(GOOS)-gnu
DATADIR:= /usr/$(TARGET)
CC:= $(TARGET)-gcc
CFLAGS:= -g

all: run-c-hello run-go-hello

bin asm:
	@mkdir -p $@

bin/c-%: asm/%.s | bin
	@$(CC) $(CFLAGS) -o $@ $<

asm/%.s: c/%.c | asm
	@$(CC) -O2 -o $@ $< -S

bin/go-%: go/%/main.go | bin
	@cd go/$* && go build -o ../../$@

run-%: bin/% | bin
	@qemu-$(ARCH) -L $(DATADIR) $<

debug-%: bin/% | bin
	qemu-$(ARCH) -L $(DATADIR) -chardev socket,path=/tmp/gdb-socket,server=on,wait=off,id=gdb0 -gdb chardev:gdb0 -S $<

clean:
	rm -f bin/*

.PHONY: run-% clean

.SECONDARY:
