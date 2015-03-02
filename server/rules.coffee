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
    console.log 'inserting'
    userId?

  update: (userId, cart) ->
    userId?

  remove: (userId, cart) ->
    userId?

CartItem._collection.allow
  insert: (userId, cartItem) ->
    userId?

  update: (userId, cartItem) ->
    userId?

  remove: (userId, cartItem) ->
    userId?
