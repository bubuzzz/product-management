Meteor.subscribe 'allProducts'

Template.adminLogin.events
  'submit form': (event) ->
    event.preventDefault()
    email = event.target.email.value
    password = event.target.password.value

    if email == 'admin@gmail.com' and password == 'admin'
      Router.go '/admin/index'

Template.adminIndex.helpers
  products: ->
    Product.find().fetch()

#
# Product
#
Template.adminAddProduct.helpers
  categories: ->
    Category.find({})

Template.adminAddProduct.events
  'submit form': (event)->
    event.preventDefault()
    name = event.target.productName.value
    shortDesc = event.target.productShortDesc.value
    categories = event.target.categories.selectedOptions

    categoryArr = []

    categoryArr.push category.value for category in categories

    Product.create name: name, short_desc: shortDesc, categories: categoryArr
    Router.go 'admin-index'

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

    Category.create name: name, short_desc: shortDesc, categories: categoryArr

    Router.go 'admin-category'

Template.adminAddCategory.helpers
  categories: ->
    Category.find({})

Template.adminCategory.helpers
  categories: ->
    Category.find({})
