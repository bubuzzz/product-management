class @OrderDetail extends Minimongoid

  @_collection: new Meteor.Collection 'orderDetail'

  @belongs_to: [
    name: 'order', identifier: 'order_id'
  ]
