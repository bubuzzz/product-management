#
# Authorization
#
Router.before ( ->
  if  !Meteor.userId()
    @redirect 'userUnauthorized'
    do @stop
  else
    do @next
  ), except: ['userUnauthorized', 'home', 'product', 'contact', 'about', 'product-detail', 'admin-login']

#
# Layout Controllers
#
AdminBaseController = RouteController.extend (
  layoutTemplate: 'admin-layout'
  yieldTemplates:
    'admin-navbar'  : to: 'admin-navbar'
    'admin-header'  : to: 'admin-header'
)

ClientBaseController = RouteController.extend (
  layoutTemplate: 'layout'
  yieldTemplates:
    'navbar'  : to: 'navbar'
    'footer'  : to: 'footer'
)

ClientBannerWithSidebarController = ClientBaseController.extend (
  yieldTemplates: _.extend {
    'banner'  : to: 'banner'
    'sidebar' : to: 'sidebar'
  }, ClientBaseController::yieldTemplates
)

ClientNoBannerWithSidebarController = ClientBaseController.extend (
  yieldTemplates: _.extend {
    'sidebar' : to: 'sidebar'
  }, ClientBaseController::yieldTemplates
)

#
# Router mappings
#
Router.map ->

  #
  # Error page
  #
  @route 'userUnauthorized',
    path: '/error'
    onAfterAction: ->
      document.title = "#{__TITLE__} Error"

  #
  # Client pages
  #
  @route 'home',
    path: '/'
    controller: ClientBannerWithSidebarController
    onAfterAction: ->
      document.title = "#{__TITLE__} Home Page"
    data: -> {
      homeSelected: 'active',
      products: Product.find {}
    }

  @route 'product',
    path: "/product/category/:_category"
    controller: ClientNoBannerWithSidebarController
    onAfterAction: ->
      document.title = "#{__TITLE__} Product"
    data: ->
      products = undefined

      if @params._category != 'all'
        products = Product.find {category_id: @params._category}
      else
        products = Product.find {}

      {
        productSelected: 'active'
        products: products
      }

  @route 'product-detail',
    path: '/product/detail/:_id'
    controller:ClientNoBannerWithSidebarController
    onAfterAction: ->
      document.title = "#{__TITLE__} Product detail"
    data: -> {
      productSelected: 'active'
      product: Product.first({_id: @params._id})
    }

  @route 'about',
    path: '/about'
    controller: ClientBaseController
    onAfterAction: ->
      document.title = "#{__TITLE__} About Us"
    data: ->
      {aboutSelected: 'active'}

  @route 'contact',
    path: '/contact'
    controller: ClientBaseController
    onAfterAction: ->
      document.title = "#{__TITLE__} Contact Us"
    data: ->
      {contactSelected: 'active'}

  @route 'shoppingCart',
    path: '/cart'
    controller: ClientNoBannerWithSidebarController
    onAfterAction: ->
      document.title = "#{__TITLE__} Your Cart"
    data: ->
      {productSelected: 'active'}

  #
  # Admin pages
  #
  @route 'admin-login',
    path: '/admin/login'
    onAfterAction: ->
      document.title = "#{__TITLE__} Login"

  @route 'admin-dashboard',
    path: '/admin'
    controller: AdminBaseController
    onAfterAction: ->
      document.title = "#{__TITLE__} Dashboard"

  @route 'admin-product',
    path: '/admin/product'
    controller: AdminBaseController
    onAfterAction: ->
      document.title = "#{__TITLE__} Product Management"

  @route 'admin-add-product',
    path: '/admin/product/add'
    controller: AdminBaseController
    onAfterAction: ->
      document.title = "#{__TITLE__} Add Product"

  @route 'admin-category',
    path: '/admin/category'
    controller: AdminBaseController
    onAfterAction: ->
      document.title = "#{__TITLE__} Category Management"

  @route 'admin-add-category',
    path: '/admin/category/add'
    controller: AdminBaseController
    onAfterAction: ->
      document.title = "#{__TITLE__} Add Category"
