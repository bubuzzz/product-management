Meteor.subscribe("allCategories")

#
# Template controllers
#
Template.sidebar.helpers
  categories: ->
    Category.find({})
