class @OrderDetail extends Mimimongoid

  @_collection: new Meteor.Collection 'orderDetail'

  @belongs_to: [
    name: 'order', identifier: 'order_id'
  ]
