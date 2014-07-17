Template.comments_create.events
  'submit form': (e, template) ->
    e.preventDefault()

    comment =
      body: $(e.target).find('[name=body]').val()
      postId: template.data._id

    Meteor.call('comment_create', comment, (err, commentId) ->
      if err
        Errors.insert(message: err.reason)
      else
        $(e.target).find('[name=body]').val('')
    )
