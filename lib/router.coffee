Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  waitOn: -> Meteor.subscribe('posts')

Router.map ->
  @route('posts_index', path: '/')
  @route('post',
    path: '/posts/:_id'
    data: -> Posts.findOne(@params._id)
  )
  @route('posts_create', path: '/posts_create')
  @route('posts_edit',
    path: '/posts/:_id/edit',
    data: -> Posts.findOne(this.params._id)
  )


requireLogin = (pause) ->
  unless Meteor.user()
    if Meteor.loggingIn()
      @render('loading')
    else
      @render('accessDenied')
      pause()

Router.onBeforeAction('loading')
Router.onBeforeAction(requireLogin, {only: 'posts_create'})
