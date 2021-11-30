package main

import (
	"fmt"
	"runtime"
)

func add(a, b int64) int64

func main() {
	fmt.Printf("Hello, %s\n", runtime.GOARCH)
	fmt.Printf("%d + %d = %d\n", 123, 456, add(123, 456))
}
