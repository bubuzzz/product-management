Meteor.subscribe("allCategories")
Meteor.subscribe("newProducts")

Template.home.helpers
  products: ->
    Product.find({})

Template.sidebar.helpers
  categories: ->
    Category.find({})
