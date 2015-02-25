title = "Product Management | "

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
  # Client pages
  #
  @route 'home',
    path: '/'
    controller: ClientBannerWithSidebarController
    onAfterAction: ->
      document.title = "#{title} Home Page"
    data: ->
      {homeSelected: 'active'}

  @route 'product',
    path: "/product/category/:_category"
    controller: ClientNoBannerWithSidebarController
    onAfterAction: ->
      document.title = "#{title} Product"
    data: ->
      products = undefined

      console.log @params._category

      if @params._category != 'all'
        products = Product.find {category_id: @params._category}
      else
        products = Product.find {}

      console.log products

      {
        productSelected: 'active'
        products: products
      }

  @route 'product-detail',
    path: '/product/detail/:_id'
    controller:ClientNoBannerWithSidebarController
    onAfterAction: ->
      document.title = "#{title} Product detail"
    data: -> {
      productSelected: 'active'
      product: Product.first({_id: @params._id})
    }

  @route 'about',
    path: '/about'
    controller: ClientBaseController
    onAfterAction: ->
      document.title = "#{title} About Us"
    data: ->
      {aboutSelected: 'active'}

  @route 'contact',
    path: '/contact'
    controller: ClientBaseController
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

  @route 'admin-dashboard',
    path: '/admin'
    controller: AdminBaseController
    onAfterAction: ->
      document.title = "#{title} Dashboard"

  @route 'admin-product',
    path: '/admin/product'
    controller: AdminBaseController
    onAfterAction: ->
      document.title = "#{title} Product Management"

  @route 'admin-add-product',
    path: '/admin/product/add'
    controller: AdminBaseController
    onAfterAction: ->
      document.title = "#{title} Add Product"

  @route 'admin-category',
    path: '/admin/category'
    controller: AdminBaseController
    onAfterAction: ->
      document.title = "#{title} Category Management"

  @route 'admin-add-category',
    path: '/admin/category/add'
    controller: AdminBaseController
    onAfterAction: ->
      document.title = "#{title} Add Category"
