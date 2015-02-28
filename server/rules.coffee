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
