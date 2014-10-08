#TODO: Write proper tests...

class A
  echo: (text) ->
    console.log 'hello'
    return text

  returnString: (string) ->

a = new A()


Tinytest.add "spies - it should create a spy and restore it", (test)->
  spy = spies.create("echoSpy", a, 'echo')
  expect(spy).to.contain.key 'restore'
  expect(spies.get('echoSpy')).to.contain.key 'restore'
  spies.restore('echoSpy')
  expect(spies.get('echoSpy')).to.be.undefined


Tinytest.add "stubs - should create a stub and restore it", (test)->
  stub = stubs.create("echoStub", a, 'echo')
  expect(stub).to.contain.key 'restore'
  expect(stubs.get('echoStub')).to.contain.key 'restore'
  stubs.restore('echoStub')
  expect(stubs.get('echoStub')).to.be.undefined
