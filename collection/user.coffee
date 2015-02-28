class @User extends Minimongoid

  @_collection: Meteor.users

  @has_many: [
    name: 'cart', foreign_key: 'user_id'
  ]

  @current: ->
    if Meteor.userId()
      Author.init Meteor.user()
