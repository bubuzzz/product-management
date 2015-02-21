Meteor.subscribe("allCategories")
Meteor.subscribe("newProducts")

Template.home.helpers
  products: ->
    categoryId = Session.get 'selectedCategory'

    console.log categoryId

    if categoryId == undefined
      Product.find({})
    else
      Product.find({category_id: categoryId})

Template.sidebar.helpers
  categories: ->
    Category.find({})

Template.sidebar.events
 'click .category': ->
   Session.set 'selectedCategory', @._id
