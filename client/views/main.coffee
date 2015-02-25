Meteor.subscribe("allCategories")
Meteor.subscribe("newProducts")

#
# helpers
#
getProductBasedOnCategory = (categoryId) ->
  if categoryId == undefined
    Product.find({})
  else
    Product.find({category_id: categoryId})

#
# Template controllers
#
Template.home.helpers
  products: ->
    categoryId = Session.get 'selectedCategory'
    getProductBasedOnCategory categoryId

Template.sidebar.helpers
  categories: ->
    Category.find({})

Template.sidebar.events
 'click .category': ->
   Session.set 'selectedCategory', @._id

 'click .all-categories': ->
   Session.set 'selectedCategory', undefined

Template.product.helpers
  products: ->
    categoryId = Session.get 'selectedCategory'
    getProductBasedOnCategory categoryId
