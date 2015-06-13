Meteor.subscribe("allCategories")

#
# UI helper
#
UI.registerHelper 'addIndex', (all, begin) ->
  _.map all, (val, index) -> _.extend index: index + begin, val

#
# Template controllers
#
Template.sidebar.helpers
  categories: ->
    Category.find {}

  cartInfo: ->
    cart = Session.get __CART__

    if cart?
      item = 0
      for key, value of cart
        item++

      {item: item, total: 0}
    else
      {item: 0, total: 0}


Template.shoppingCart.helpers
  items: ->
    cart = Session.get __CART__

    console.log cart

    items = []
    for key, value of cart
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

      cart = Cart._collection.findOne user_id: Meteor.userId()

      console.log cart

      if cart == undefined
        savedCart = Cart.create user_id: Meteor.userId()
        cartItem = CartItem.create {
          product_id: @_id
          product_name: @name
          quantity: 1
          total: @price
          cart_id: savedCart.id
        }

      else
        currentCartItem = CartItem._collection.findOne product_id: @_id, cart_id: cart.id

        if currentCartItem == undefined
          currentCartItem = CartItem.create {
            product_id: @_id
            product_name: @name
            quantity: 1
            total: @price
            cart_id: cart.id
          }
        else
          currentCartItem.quantity += 1
          currentCartItem.save


      if !currentCart? or !currentCart[key]?
        currentCart = {} if !currentCart?
        currentCart[key] = id: @_id, name: @name, quantity: 1, total: @price
      else
          oldItem = currentCart[key]
          oldItem.quantity = oldItem.quantity + 1
          currentCart[key] = oldItem

      Session.set __CART__, currentCart

      return
