title = "Product Management | "


#
# Route Mappings
#
Router.configure
  layoutTemplate: 'layout'

Router.map ->

  #
  # Client pages
  #
  @route 'home',
    path: '/'
    yieldTemplates:
      'navbar'  : to: 'navbar'
      'footer'  : to: 'footer'
      'sidebar' : to: 'sidebar'
    onAfterAction: ->
      document.title = "#{title} Home Page"
    data: ->
      {homeSelected: 'active'}

  @route 'about',
    path: '/about'
    yieldTemplates:
      'navbar': to: 'navbar'
      'footer': to: 'footer'
    onAfterAction: ->
      document.title = "#{title} About Us"
    data: ->
      {aboutSelected: 'active'}

  @route 'contact',
    path: '/contact'
    yieldTemplates:
      'navbar': to: 'navbar'
      'footer': to: 'footer'
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

  @route 'admin-index', path: '/admin/index'
  @route 'admin-add-product', path: '/admin/product/add'
