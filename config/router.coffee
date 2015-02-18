Router.configure
  layoutTemplate: 'layout'

Router.map ->
  
  #
  # Client pages
  #
  @route 'home',
    path: '/'
    yieldTemplates:
      'navbar': to: 'navbar'
      'footer': to: 'footer'
      'sidebar': to: 'sidebar'

  @route 'about',
    path: '/about'
    yieldTemplates:
      'navbar': to: 'navbar'
      'footer': to: 'footer'

  @route 'contact',
    path: '/contact'
    yieldTemplates:
      'navbar': to: 'navbar'
      'footer': to: 'footer'

  #
  # Admin pages
  #
  @route 'admin-login', path: '/admin/login'
  @route 'admin-index', path: '/admin/index'
  @route 'admin-add-product', path: '/admin/product/add'
