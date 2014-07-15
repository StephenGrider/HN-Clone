Template.posts_edit.events
  'submit form': (e) ->
    e.preventDefault()

    postProperties =
      url: $(e.target).find('[name=url]').val(),
      title: $(e.target).find('[name=title]').val()

    Posts.update(@_id, {$set: postProperties}, (err) ->
      if err
        alert(err.reason)
      else
        Router.go('posts_index')
    )

  'click .delete': (e) ->
    e.preventDefault()

    if confirm('Delete this post?')
      Posts.remove(@._id)
      Router.go('posts_index')
