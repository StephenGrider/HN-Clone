Template.posts_create.events
  'submit form': (e) ->
    e.preventDefault()
    post =
      url: $(e.target).find('[name=url]').val()
      title: $(e.target).find('[name=title]').val()
      message: $(e.target).find('[name=message]').val()

    Meteor.call('post_create', post, (err, id) ->
      if err
        addError(err.reason)
      else
        Router.go('posts_index', {_id: id})
    )
