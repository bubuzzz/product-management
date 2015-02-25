Meteor.methods
  'insertProduct': (name, shortDesc, categoryId) ->
    Product.create name: name, short_desc: shortDesc, category_id: categoryId

  'findProductByCategoryId': (categoryId, callback) ->
    callback(Product.find({category_id: categoryId}))
    
  'insertCategory': (name, shortDesc, categoryArr) ->
    Category.create name: name, short_desc: shortDesc, categories: categoryArr
