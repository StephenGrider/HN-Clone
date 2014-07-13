@Posts = new Meteor.Collection('posts')

Meteor.methods
  post: (postAttrs) ->
    user = Meteor.user()
    postWithSameLike = Posts.findOne(url: postAttrs.url)

    unless user
      throw new Meteor.Error(401, 'You need to login to post')

    unless postAttrs.title
      throw new Meteor.Error(422, 'Posts must have a title')

    if postAttrs.url and postWithSameLike
      throw new Meteor.Error(302, 'This link has been posted')

    post = _.extend(
      _.pick(postAttrs, 'url', 'title', 'message'),
      {
        userId: user._id,
        author: user.username,
        submitted: new Date().getTime()
      }
    )

    Posts.insert(post)
