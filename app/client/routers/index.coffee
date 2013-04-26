class App.Routers.Index extends Backbone.Router

  _.extend @prototype, Backbone.FrameManager

  routes:
    ''                : App.Views.Index

  initialize: ->
