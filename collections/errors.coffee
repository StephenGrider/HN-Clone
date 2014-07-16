@Errors = new Meteor.Collection(null)


@addError = (message) ->
  Errors.insert(message: message, seen: false)

@clearErrors = ->
  Errors.remove({})
