# Test ARM64

This is a stub project/playground to test out ARM64 on an x86 machine.

For depdencies, I have these installed as a minimum:

```
$ pamac list | egrep '\b(aarch64|qemu|go)\b`
aarch64-linux-gnu-binutils          2.37-1                      community  32.2 MB
aarch64-linux-gnu-gcc               11.2.0-1                    community  280.6 MB
aarch64-linux-gnu-gdb               11.1-1                      community  9.6 MB
aarch64-linux-gnu-glibc             2.34-1                      community  20.2 MB
aarch64-linux-gnu-linux-api-headers 5.8-1                       community  5.2 MB
go                                  2:1.17.3-1                  community  453.3 MB
qemu                                6.1.0-5                     extra      50.6 MB
qemu-headless-arch-extra            6.1.0-5                     extra      773.9 MB
```

Optionally (and commented out) is the use of `zig` for `CC`. In addition to being
the main `zig` compiler, it is a full C/C++ compiler with excellent cross-compiling
support enabled by embedding libclang/llvm.
