class @Category extends Minimongoid
  @_collection: new Meteor.Collection 'category'

  @has_many: [
    {name: 'categories', foreign_key: 'category_id'}
    {name: 'products', foreign_key: 'category_id'}
  ]

  @belongs_to: [
    name: 'category'
    identifier: 'category_id'
  ]
