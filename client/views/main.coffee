Meteor.subscribe("allCategories")

#
# Template controllers
#
Template.sidebar.helpers
  categories: ->
    Category.find({})

Template.product.events
  'click .btn-add-to-cart': (event) ->
    event.preventDefault()
    console.log Meteor.userId

    if !Meteor.userId()
      alert "You need to login"
    else
      Router.go 'cart'
