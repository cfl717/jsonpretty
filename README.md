# WASM

学习wasm示例代码

go,zig wasm的示例代码。使用golang的http服务运行各自目录下的index.html

make自动编译和wasm代码目录下的wasm文件

## 运行

make运行后，生成的httpserver文件直接运行。然后在浏览器运行http:{host}:80/{zig/go}

## 添加zig

zig wasm example,这部分代码来自：https://github.com/shritesh/zig-wasm-dom

### build zig wasm

zig build-lib -O ReleaseSmall -targe wasm32-wasi -dynamic zigdom.zig