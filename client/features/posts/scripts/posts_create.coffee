Template.posts_create.events
  'submit form': (e) ->
    e.preventDefault()
    post =
      url: $(e.target).find('[name=url]').val()
      title: $(e.target).find('[name=title]').val()
      message: $(e.target).find('[name=message]').val()

    Meteor.call('post_create', post, (err, id) ->
      alert(err.reason) if err

      Router.go('posts_index')
    )

Template.posts_index.events
  'click .delete': (e) ->

    Meteor.call('post_delete', _id: 'PtmYYjoRzLTxEfXtA', -> )
