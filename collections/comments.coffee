@Comments = new Meteor.Collection('comments')


Meteor.methods
  comment_create: (commentAttrs) ->
    user = Meteor.user()
    post = Posts.findOne(commentAttrs.postId)

    unless user
      throw new Meteor.Error(401, 'You need to login to post')

    unless commentAttrs.body
      throw new Meteor.Error(422, 'Comment must have text')

    unless post
      throw new Meteor.Error(422, 'You must comment on a post')

    comment = _.extend(
      _.pick(commentAttrs, 'postId', 'body'),
      {
        userId: user._id,
        author: user.username,
        submitted: new Date().getTime()
      }
    )

    Posts.update(comment.postId, {$inc: {commentsCount: 1}})

    Comments.insert(comment)
