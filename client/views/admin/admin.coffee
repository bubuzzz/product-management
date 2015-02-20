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

Template.adminIndex.events
  'click #add-product': ->
    Router.go 'admin-add-product'

Template.adminAddProduct.helpers
  categories: ->
    Category.find({})

Template.adminAddProduct.events
  'submit form': (event)->
    event.preventDefault()
    name = event.target.productName.value
    shortDesc = event.target.productShortDesc.value
    categories = event.target.categories.selectedOptions

    Product.create name: name, short_desc: shortDesc
