class @CartItem extends Minimongoid
  @_collection: new Meteor.Collection 'cartItem'

  @belongs_to: [
    name: 'cart'
    identifier: 'cart_id'
  ]
