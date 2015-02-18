Meteor.publish 'allProducts', ->
  return Product.find()
