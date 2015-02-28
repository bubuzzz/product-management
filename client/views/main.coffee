Meteor.subscribe("allCategories")

#
# Template controllers
#
Template.sidebar.helpers
  categories: ->
    Category.find({})

Template.shoppingCart.helpers
  items: ->
    cart = Session.get 'cart'

    console.log "cart: #{cart}"

    items = []
    items = items.push value for key, value of cart

    console.log items
    items


Template.product.events
  'click .btn-add-to-cart': (event) ->
    event.preventDefault()

    if !Meteor.userId()
      alert "You need to login"
    else
      currentCart = Session.get 'cart'

      key = @_id

      if currentCart == undefined || currentCart[key] == undefined
        currentCart = {} if currentCart == undefined
        currentCart[key] = id: @_id, name: @name, quantity: 0, total: @price
      else
          oldItem = currentCart[key]
          oldItem.quantity = oldItem.quantity + 1
          currentCart[key] = oldItem

      Session.set 'cart', currentCart

      return
