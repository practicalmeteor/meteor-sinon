class SinonObjects

  forbiddenNames: ['create', 'get', 'restore', 'restoreAll']

  get: (name)->
    return @[name]

  restore:(name)->
    if not @[name]
      console.warn "Trying to restore a non-existing spy/stub with name: #{name}"
      return

    if @[name].restore
      @[name].restore()
      delete @[name]
    return

  restoreAll: ->
    for key of @
      @restore key


class SinonSpies extends SinonObjects
  create: (name, obj, method)->
    expect(name).to.be.a("string")
    if @forbiddenNames.indexOf(name) >= 0
      throw Error("A spy can't be named '#{name}'. Please choose another name.")
    if not obj and not method
      # Creates an anonymous function that records arguments, this value, exceptions and return values for all calls.
      return @[name] = sinon.spy()

    if not method
      expect(obj).to.be.a("function")
      return @[name] = sinon.spy(obj)

    expect(obj).to.be.an "object"
    expect(method).to.be.a "string"
    if @[name]
      @restore name
    return @[name] = sinon.spy(obj, method)



class SinonStubs extends SinonObjects
  create: (name, obj, method)->
    expect(name).to.be.a("string")
    if @forbiddenNames.indexOf(name) >= 0
      throw Error("A stub can't be named '#{name}'. Please choose another name.")
    if not obj and not method
      return @[name] = sinon.stub()

    expect(obj).to.be.an("object")
    expect(method).to.be.a("string")
    if @[name]
      @restore name
    return @[name] = sinon.stub(obj, method)


# A test spy is a function that records arguments, return value,
# the value of this and exception thrown (if any) for all its calls.
# A test spy can be an anonymous function or it can wrap an existing function or object method.
# To learn more http://sinonjs.org/docs/#spies-api
spies = new SinonSpies()


# Test stubs are functions (spies) with pre-programmed behavior.
# This is a wrapper for sinonjs stubs to learn more http://sinonjs.org/docs/#stubs-api
stubs = new SinonStubs()
