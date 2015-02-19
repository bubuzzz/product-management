class @Category extends Minimongoid
  @_collection: new Meteor.Collection('category')

  @has_many: ['category', 'product']
