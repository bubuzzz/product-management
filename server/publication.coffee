Meteor.publish 'allProducts', ->
  return Product.find()

Meteor.publish 'allCategories', ->
  return Category.find()

Meteor.publish 'newProducts', ->
  return Product.find({hot: 1})
