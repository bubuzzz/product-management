Meteor.startup ->
  user = Meteor.users.findOne username:"admin"
  console.log user

  if !user?
    userObject =
      username: "admin"
      email: "admin@gmail.com"
      password: "password"

    Accounts.createUser userObject
    console.log 'admin is created'

  console.log 'good to go'

Meteor.methods
  'insertProduct': (name, shortDesc, categoryId) ->
    Product.create name: name, short_desc: shortDesc, category_id: categoryId

  'findProductByCategoryId': (categoryId, callback) ->
    callback(Product.find({category_id: categoryId}))

  'insertCategory': (name, shortDesc, categoryArr) ->
    Category.create name: name, short_desc: shortDesc, categories: categoryArr
