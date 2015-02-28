class @Cart extends Minimongoid
  @_collection: new Meteor.Collection 'cart'

  @belongs_to: [
    name: 'user', identifier: "user_id"
  ]
  
  @has_many: [
    name: 'cartItems', foreign_key: 'cart_id'
  ]
