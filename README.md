# jsonpretty

实现web js调用golang编译的wasm方法。

build.sh自动编译wasm目录下的golang wasm文件和可执行的web服务器jsonpretty文件。

## 运行

build.sh运行后，生成的jsonpretty文件直接运行。然后在浏览器运行http:{host}:80,其中host为运行所在机器的ip。
