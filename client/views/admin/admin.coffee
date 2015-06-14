Meteor.subscribe 'allProducts'

Template.adminLogin.events
  'submit form': (event) ->
    event.preventDefault()
    email = event.target.email.value
    password = event.target.password.value

    console.log email
    console.log password

    Meteor.loginWithPassword emailVar, passwordVar ->
      Router.go 'admin-dashboard'

#
# Product
#
Template.adminProduct.helpers
  products: ->
    Product.find({})

Template.adminAddProduct.helpers
  categories: ->
    Category.find({})

Template.adminAddProduct.events
  'submit form': (event)->
    event.preventDefault()
    name = event.target.productName.value
    shortDesc = event.target.productShortDesc.value
    categoryId = event.target.categories.value

    Meteor.call 'insertProduct', name, shortDesc, categoryId
    Router.go 'admin-product'

#
# Category
#
Template.adminAddCategory.events
  'submit form': (event) ->
    event.preventDefault()
    name = event.target.categoryName.value
    shortDesc = event.target.categoryShortDesc.value
    categories = event.target.categories.selectedOptions

    categoryArr = []
    categoryArr.push category.value for category in categories

    Meteor.call 'insertCategory', name, shortDesc, categoryArr, (event, result) ->
      console.log result.errors

    Router.go 'admin-category'

Template.adminAddCategory.helpers
  categories: ->
    Category.find({})

Template.adminCategory.helpers
  categories: ->
    Category.find({})
