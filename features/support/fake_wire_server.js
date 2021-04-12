const http = require("http");

module.exports = exports = class {
    constructor(port, protocol) {
        this.port = port
        this.host = "127.0.0.1"
        this.protocol = protocol
        this.delay = 1
    }

    run(port = null, protocol = null) {
        if (this.server?.listening) {
            this.server.close()
        }

        if (port) {
            this.port = port
        }

        if (protocol) {
            this.protocol = protocol
        }

        this.server = http.createServer(this.requestListener.bind(this));
        this.server.listen(this.port, this.host, () => {});
    }

    stop() {
        this.server.close()
    }

    setDelay(delayInSeconds = 0) {
        this.delay = delayInSeconds * 1000 || 1
    }

    async requestListener(request, res) {
        await setTimeout(() => {
            res.writeHead(200);
            res.end("My first server!");
        }, this.delay)
    }
}

exports.default

// const fakeServer = new exports("54321", [])

// fakeServer.run()