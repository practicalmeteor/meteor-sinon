#TODO: Write proper tests...

class A
  log: (text) ->
    console.log text
    return text

  logError: (text) ->
    console.error text
    return text

a = new A()


Tinytest.add "spies - it should create a spy and restore it", (test)->
  spy = spies.create("logSpy", a, 'log')
  expect(spy).to.contain.key 'restore'
  expect(spies.get('logSpy')).to.contain.key 'restore'
  expect(spies.logSpy).to.contain.key 'restore'
  expect(a.log).to.contain.key 'restore'
  spies.restore('logSpy')
  expect(spies.get('logSpy')).to.be.undefined
  expect(spies.logSpy).to.be.undefined
  expect(a.log).to.not.contain.key 'restore'


Tinytest.add "stubs - it should create a stub and restore it", (test)->
  stub = stubs.create("logStub", a, 'log')
  expect(stub).to.contain.key 'restore'
  expect(stubs.get('logStub')).to.contain.key 'restore'
  expect(stubs.logStub).to.contain.key 'restore'
  expect(a.log).to.contain.key 'restore'
  stubs.restore('logStub')
  expect(stubs.get('logStub')).to.be.undefined
  expect(stubs.logStub).to.be.undefined
  expect(a.log).to.not.contain.key 'restore'


Tinytest.add "spies - restoreAll - it should restore all spies", (test)->
  logSpy = spies.create("logSpy", a, 'log')
  expect(spies.logSpy).to.contain.key 'restore'
  expect(a.log).to.contain.key 'restore'

  logErrorSpy = spies.create("logErrorSpy", a, 'logError')
  expect(spies.logErrorSpy).to.contain.key 'restore'
  expect(a.logError).to.contain.key 'restore'

  spies.restoreAll()
  expect(spies.logSpy).to.be.undefined
  expect(a.log).to.not.contain.key 'restore'
  expect(spies.logErrorSpy).to.be.undefined
  expect(a.logError).to.not.contain.key 'restore'


Tinytest.add "stubs - restoreAll - it should restore all stubs", (test)->
  logStub = stubs.create("logStub", a, 'log')
  expect(stubs.logStub).to.contain.key 'restore'
  expect(a.log).to.contain.key 'restore'

  logErrorStub = stubs.create("logErrorStub", a, 'logError')
  expect(stubs.logErrorStub).to.contain.key 'restore'
  expect(a.logError).to.contain.key 'restore'

  stubs.restoreAll()
  expect(stubs.logStub).to.be.undefined
  expect(a.log).to.not.contain.key 'restore'
  expect(stubs.logErrorStub).to.be.undefined
  expect(a.logError).to.not.contain.key 'restore'


Tinytest.add "spies - create - it should throw an error if the spy is one of the forbidden names", (test)->
  createGetSpy = ->
    spies.create("get", a, 'log')
  test.throws createGetSpy, "can't be named"


Tinytest.add "stubs - create - it should throw an error if the stub is one of the forbidden names", (test)->
  createGetStub = ->
    stubs.create("get", a, 'log')
  test.throws createGetStub, "can't be named"


Tinytest.add "spies - restore - it should not throw an error if the spy was restored before using spies.spyName.restore", (test)->
  spies.create("log", a, 'log')
  spies.log.restore
  spies.restore('log')


Tinytest.add "stubs - restore - it should not throw an error if the stub was restored before using stubs.stubName.restore", (test)->
  stubs.create("log", a, 'log')
  stubs.log.restore
  stubs.restore('log')
