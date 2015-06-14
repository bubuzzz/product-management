Meteor.startup ->
  user = Meteor.users.findOne email:"admin@gmail.com"

  if user?
    userObject =
      username: "bubuzzz"
      mail: "admin@gmail.com"
      password: "password"

    Accounts.createUser userObject
    console.log 'admin is created'
  else
    console.log 'admin is already created'


Meteor.methods
  'insertProduct': (name, shortDesc, categoryId) ->
    Product.create name: name, short_desc: shortDesc, category_id: categoryId

  'findProductByCategoryId': (categoryId, callback) ->
    callback(Product.find({category_id: categoryId}))

  'insertCategory': (name, shortDesc, categoryArr) ->
    Category.create name: name, short_desc: shortDesc, categories: categoryArr
