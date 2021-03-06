# file: src/core/index.coffee

EventEmitter = require('events').EventEmitter

class Core extends EventEmitter

  constructor: (@opts)->
    Datastore = require('nedb')

    @Person = @opts?.Person or require("#{__dirname}/PersonService")(
      persons: new Datastore { filename: 'db/persons', autoload: true }
    )

    @Contact = @opts?.Contact or require("#{__dirname}/ContactService")(
      contacts: new Datastore { filename: 'db/contacts', autoload: true }
    )

    @Plugin = @opts?.Plugin or require("#{__dirname}/PluginService")(
      plugins: new Datastore { filename: 'db/plugins', autoload: true }
    )


module.exports = (opts)->
  return new Core(opts)
