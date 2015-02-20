class @Category extends Minimongoid
  @_collection: new Meteor.Collection 'category'

  @has_and_belongs_to_many: [
    {name: 'products', class_name: 'Product'}
  ]

  @has_many: [
    {name: 'categories', foreign_key: 'category_id'}
  ]

  @belongs_to: [
    name: 'category'
    identifier: 'category_id'
  ]
