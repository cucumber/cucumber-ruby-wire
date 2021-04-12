const { Given, When, Then, After, Before } = require('@cucumber/cucumber');
const { setWorldConstructor, World } = require('@cucumber/cucumber')
const FakeWireServer = require('../support/fake_wire_server')
const fs = require('fs');
const assert = require('assert')
const { spawnSync } = require("child_process");

let fakeWireServer = null;
let commandResult = 0;
let stdout = "";
let stderr = "";

class CustomWorld extends World {
  constructor(options) {
    super(options)

    this.files = []
  }

  addFile(fileName, content) {
    fs.writeFileSync(fileName, content)
    this.files.push(fileName)
  }

  cleanFiles() {
    this.files.forEach((file) => {
      fs.unlinkSync(file)
    })

    this.files = []
  }
}

setWorldConstructor(CustomWorld)

Before(function () {
  commandResult = 0
  stdout = ""
  stderr = ""
})

After(function () {
  if (fakeWireServer) {
    fakeWireServer.stop()
    fakeWireServer = null
  }

  this.cleanFiles()
})

Given('there is a wire server running on port {int} which understands the following protocol:', function (int, dataTable) {
  if (!fakeWireServer) {
    fakeWireServer = new FakeWireServer(int, dataTable)
  }

  fakeWireServer.run(int, dataTable)
});

Given('a file named {string} with:', function (string, docString) {
  this.addFile(string, docString)
});

Given('I have environment variable PORT set to {string}', function (string) {
  return 'pending';
});

Given('the wire server takes {float} seconds to respond to the invoke message', function (float) {
  fakeWireServer.setDelay(float)
});

When('I run {string}', function (string) {
  let result = spawnSync(string.split(" ")[0], string.split(" ").slice(1));

  commandResult = result.status
  stdout = result.stdout.toString()
  stderr = result.stderr.toString()
});

Then('it should fail with exactly:', function (docString) {
  assert.strictEqual(commandResult, 0)
  assert.strictEqual(docString, stderr)
});

Then('the stderr should not contain anything', function () {
  assert.strictEqual(stderr, "")
});

Then('the stderr should contain:', function (docString) {
  assert.strictEqual(stderr, docString)
});

Then('it should pass with exactly:', function (docString) {
  assert.strictEqual(commandResult, 0)
  assert.strictEqual(stdout, docString)
});

Then('it should pass with:', function (docString) {
  assert.strictEqual(commandResult, 0)
  assert.strictEqual(stdout, docString)
});

Then('the output should contain:', function (docString) {
  assert.strictEqual(stdout, docString)
});

Then('the wire server should have received the following messages:', function (dataTable) {
  return 'pending';
});

Then('it should fail with:', function (docString) {
  return 'pending';
});