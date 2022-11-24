SRC = $(wildcard *.go)
wasmSRC = $(wildcard wasm/*.go)

all: httpserver  go/golang.wasm zig/zigdom.wasm

zig/zigdom.wasm:zig/zigdom.zig
	zig build-lib -O ReleaseSmall -target wasm32-wasi -dynamic zig/zigdom.zig
	mv zigdom.wasm zig
	rm zigdom.wasm.o	

go/golang.wasm:go/wasm.go
	GOOS=js GOARCH=wasm go build -o go/golang.wasm $^
	
httpserver:main.go
	GOOS=linux GOARCH=amd64 go build -o httpserver $^
	chmod +x httpserver

.PHONY: clean
clean:
	rm -rvf httpserver
	rm -rvf go/golang.wasm
	rm -rvf zig/zigdom.wasm