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
    console.log 'here'
    a = Product.find().fetch()
    console.log a
    a

Template.adminIndex.events
  'click #add-product': ->
    Router.go 'admin-add-product'

Template.adminAddProduct.events
  'submit form': (event)->
    event.preventDefault()
    name = event.target.productName.value
    Product.create name: name
