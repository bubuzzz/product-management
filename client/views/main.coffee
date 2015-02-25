Meteor.subscribe("allCategories")
Meteor.subscribe("newProducts")

#
# helpers
#
getProductBasedOnCategory = (categoryId) ->
  if categoryId == 'all' or category == undefined
    Product.find({})
  else
    Product.find({category_id: categoryId})

#
# Template controllers
#
Template.home.helpers
  products: ->
    getProductBasedOnCategory 'all'

Template.sidebar.helpers
  categories: ->
    Category.find({})
