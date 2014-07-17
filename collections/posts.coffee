@Posts = new Meteor.Collection('posts')

Posts.allow
  update: ownsDocument,
  remove: ownsDocument

Posts.deny
  update: (userId, post, fieldNames) ->
    _.without(fieldNames, 'url', 'title').length > 0


Meteor.methods
  post_create: (postAttrs) ->
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
        submitted: new Date().getTime(),
        commentsCount: 0
      }
    )

    Posts.insert(post)
