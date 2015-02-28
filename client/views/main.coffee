Meteor.subscribe("allCategories")

#
# UI helper
#
UI.registerHelper 'addIndex', (all, begin) ->
  _.map all, (val, index) -> _.extend {index: index + begin}, val


#
# Template controllers
#
Template.sidebar.helpers
  categories: ->
    Category.find({})

Template.shoppingCart.helpers
  items: ->
    cart = Session.get __CART__

    console.log cart

    items = []
    for key, value of cart
      console.log value
      items.push value

    items


Template.product.events
  'click .btn-add-to-cart': (event) ->
    event.preventDefault()

    if !Meteor.userId()
      alert "You need to login"
    else
      currentCart = Session.get __CART__

      key = @_id

      if currentCart == undefined || currentCart[key] == undefined
        currentCart = {} if currentCart == undefined
        currentCart[key] = id: @_id, name: @name, quantity: 1, total: @price
      else
          oldItem = currentCart[key]
          oldItem.quantity = oldItem.quantity + 1
          currentCart[key] = oldItem

      Session.set __CART__, currentCart

      return
