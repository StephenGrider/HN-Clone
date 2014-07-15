@Errors = new Meteor.Collection(null)


addError = (message) ->
  Errors.insert(message: message)
