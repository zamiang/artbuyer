#
# Declare your asset packages used by nap (https://github.com/craigspaeth/nap)
#

@js =
  vendor: [
    '/vendor/underscore.js'
    '/vendor/jquery.js'
    '/vendor/backbone.js'
    '/app/client/vendor/**/*.js'
  ]
  app: [
    '/app/client/app.coffee'
    '/app/client/lib/**/*.coffee'
    '/app/client/models/**/*.coffee'
    '/app/client/collections/**/*.coffee'
    '/app/client/views/**/*.coffee'
    '/app/client/routers/**/*.coffee'
    '/app/client/setup.coffee'
  ]

@css =
  all: [
    '/app/stylesheets/shared/**/*.styl'
    '/app/stylesheets/artworks/**/*.styl'
    '/app/stylesheets/artists/**/*.styl'
    '/app/stylesheets/artwork_inquiry_requests/**/*.styl'
  ]

@jst =
  templates: [
    '/app/templates/artworks/**/*.jade'
    '/app/templates/users/**/*.jade'
    '/app/templates/artists/**/*.jade'
  ]
