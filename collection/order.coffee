class @Order extends Minimongoid
  @_collection: new Meteor.Collection 'order'

  @belongs_to: [
    name: 'user', identifier: 'user_id'
  ]

  @has_many: [
    name: 'orderDetails', foreign_key: 'order_id'
  ]
