export GOARCH:= arm64
export GOOS:= linux
ARCH:= aarch64
TARGET:= $(ARCH)-$(GOOS)-gnu
CC:= $(TARGET)-gcc
#CC:= zig cc -target $(TARGET)
GO:= env GOOS=$(OS) GOARCH=$(GOARCH) go

all: run-c-hello run-go-hello

bin:
	mkdir -p $@

bin/c-%: c/%.c | bin
	$(CC) $(CFLAGS) -o $@ $<

bin/go-%: go/%/main.go | bin
	cd go/$* && $(GO) build -o ../../$@

run-%: bin/% | bin
	qemu-$(ARCH) -L /usr/$(TARGET) $<

clean:
	rm -f bin/*

.PHONY: run-% clean

.SECONDARY:
