Template.posts_index.helpers
  posts: -> Posts.find({}, {sort:  {submitted: -1}})


Template.posts_show.helpers
  comments: ->
    Comments.find(postId: @_id).fetch()


Template.post.helpers
  domain: ->
    a = document.createElement('a')
    a.href = @url
    a.hostname

  ownPost: ->
    @userId == Meteor.userId()
