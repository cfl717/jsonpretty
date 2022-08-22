SRC = $(wildcard *.go)
wasmSRC = $(wildcard wasm/*.go)

all: jsonpretty  assets/json.wasm

assets/json.wasm: wasm/json.wasm
	cp wasm/json.wasm assets/json.wasm

wasm/json.wasm:$(wasmSRC)
	GOOS=js GOARCH=wasm go build -o wasm/json.wasm $^
	
jsonpretty:$(SRC)
	GOOS=linux GOARCH=amd64 go build -o jsonpretty $^
	chmod +x jsonpretty

.PHONY: clean
clean:
	rm -rvf jsonpretty
	rm -rvf assets/json.wasm
	rm -rvf wasm/json.wasm