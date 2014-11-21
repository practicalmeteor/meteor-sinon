[![Build Status](https://travis-ci.org/practicalmeteor/meteor-sinon.svg?branch=master)](https://travis-ci.org/practicalmeteor/meteor-sinon)
## Overview

Standalone test spies, stubs and mocks for JavaScript, packaged for meteor. Includes [Sinon-Chai](http://chaijs.com/plugins/sinon-chai), that adds a set of custom sinon assertions to [practicalmeteor:chai](https://atmospherejs.com/practicalmeteor/chai).

## spies and stubs factories with restoreAll support

This meteor package adds spies and stubs factories with restoreAll support that you can use to restore all test spies and stubs during tear down of tests or test suites.

### spies factory API

```
// Creates a spy named 'spyName' for obj.method which you can later easily access by 'spies.spyName'
// @obj [Object] obj and method are optional. If you don't specify them, it will create an anonymous spy function.
// @method [String] The method of @obj to create a spy for.
spies.create(spyName, obj, method)

// You can just use spies.spyName instead of this method.
spies.get(spyName)

// You can just use spies.spyName.restore instead of this method.
spies.restore(spyName)

// Restore all spies created with spies.create
spies.restoreAll()
```

Example:

```
spies.create('log', console, 'log');
console.log('Hello world');
expect(spies.log).to.have.been.calledWith('Hello world');
...
// Later on in your test or test suite tear down
spies.restoreAll();
```

### stubs factory API

```
// Creates a stub named 'stubName' for obj.method which you can later easily access by 'stubs.stubName'
// @obj [Object] obj and method are optional. If you don't specify them, it will create an anonymous stub function.
// @method [String] The method of @obj to create a stub for.
stubs.create(stubName, obj, method)

// You can just use stubs.spyName instead of this method.
stubs.get(stubName)

// You can just use stubs.stubName.restore instead of this method.
stubs.restore(stubName)

// Restore all stubs created with stubs.create
stubs.restoreAll()
```

Example:

```
todos = new Mongo.collection('Todos');
stubs.create('findOne', todos, 'findOne');
stubs.findOne.returns({name: 'My todo'});

// Your test code goes here.
...

// Later on in your test or test suite tear down
stubs.restoreAll();
```

Note: spies and stubs cannot be named create, get, restore, or restoreAll, because those property names are already taken by the factories themselves.

## Exports

* sinon
* spies
* stubs

## Versions

Sinon.js: 1.10.3

Sinon-Chai: 2.6.0

## Changelog

[CHANGELOG](https://github.com/practicalmeteor/meteor-sinon/blob/master/CHANGELOG.md)

## Documentation

* [Sinon.JS](http://sinonjs.org/)

* [Sinon-Chai](http://chaijs.com/plugins/sinon-chai)

## License

This Meteor package is MIT.

The Sinon.JS [license](https://github.com/cjohansen/Sinon.JS/blob/master/LICENSE) is BSD.

The Sinon-Chai [license](https://github.com/domenic/sinon-chai/blob/master/LICENSE.txt) is quite interesting :)
