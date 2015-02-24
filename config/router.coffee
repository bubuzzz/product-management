title = "Product Management | "

#
# Layout Controllers
#
AdminController = RouteController.extend (
  layoutTemplate: 'admin-layout'
  yieldTemplates:
    'admin-navbar': to: 'admin-navbar'
    'admin-header': to: 'admin-header'
)

ClientController = RouteController.extend (
  layoutTemplate: 'layout'
  yieldTemplates:
    'navbar'  : to: 'navbar'
    'footer'  : to: 'footer'
    'sidebar' : to: 'sidebar'
)

ClientNoSidebarController = ClientController.extend (
  yieldTemplates:
    'navbar'  : to: 'navbar'
    'footer'  : to: 'footer'
)

#
# Router mappings
#
Router.map ->

  #
  # Client pages
  #
  @route 'home',
    path: '/'
    controller: ClientController
    onAfterAction: ->
      document.title = "#{title} Home Page"
    data: ->
      {homeSelected: 'active'}



  @route 'about',
    path: '/about'
    controller: ClientNoSidebarController
    onAfterAction: ->
      document.title = "#{title} About Us"
    data: ->
      {aboutSelected: 'active'}

  @route 'contact',
    path: '/contact'
    controller: ClientNoSidebarController
    onAfterAction: ->
      document.title = "#{title} Contact Us"
    data: ->
      {contactSelected: 'active'}

  #
  # Admin pages
  #
  @route 'admin-login',
    path: '/admin/login'
    onAfterAction: ->
      document.title = "#{title} Login"

  @route 'admin-index',
    path: '/admin/index'
    controller: AdminController
    onAfterAction: ->
      document.title = "#{title} Product Managment"

  @route 'admin-add-product',
    path: '/admin/product/add'
    controller: AdminController
    onAfterAction: ->
      document.title = "#{title} Add Product"

  @route 'admin-add-category',
    path: '/admin/category/add'
    controller: AdminController
    onAfterAction: ->
      document.title = "#{title} Add Category"

  @route 'admin-category',
    path: '/admin/category'
    controller: AdminController
    onAfterAction: ->
      document.title = "#{title} Category Management"
