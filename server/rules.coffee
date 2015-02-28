Product._collection.allow
  insert: ->
    true

  update: ->
    true

  remove: ->
    true


Category._collection.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true


Cart._collection.allow
  insert: (userId, cart) ->
    userId == cart.createdBy

  update: (userId, cart) ->
    userId == cart.createdBy

  remove: (userId, cart) ->
    userId == cart.createdBy

CartItem._collection.allow
  insert: (userId, cartItem) ->
    userId?

  update: (userId, cartItem) ->
    userId?

  remove: (userId, cartItem) ->
    userId?
