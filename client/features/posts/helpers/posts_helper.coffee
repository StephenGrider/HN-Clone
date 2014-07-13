Template.posts_index.helpers
  posts: -> Posts.find({}, {sort:  {submitted: -1}})

Template.post.helpers
  domain: ->
    a = document.createElement('a')
    a.href = this.url
    a.hostname
