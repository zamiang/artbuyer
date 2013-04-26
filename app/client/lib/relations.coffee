# Wraps `get` and `set` to wrap raw data with instances of models. Also wraps `toJSON`
# to give better serialized output.
# mixin with _.extend @prototype, Backbone.Relations
#
# e.g.
#
# class Paws extends Backbone.Collection
# class Dog extends Backbone.Model
#   _.extend @prototype, Backbone.Relations
#
#  relations: ->
#    paws: Paws
#
# dog = new Dog { paws: [{ toes: 5 }] }
# dog.get('paws') # Returns a collection
#

Relations = ->

Relations::get = (attr) ->
  @_relationCache ?= {}
  _super = Backbone.Model::get.call @, attr
  klass = @relations()[attr]
  if klass?
    unless @_relationCache[attr]?
      isBackboneClass = _super?.cid or _super?.models
      instance = @_relationCache[attr] = if isBackboneClass then _super else new klass _super
      instance.parent = @
    else
      instance = @_relationCache[attr]
    instance
  else
    _super

Relations::set = ->
  Backbone.Model::set.apply @, arguments
  return @ unless @_relationCache?
  if _.isObject arguments[0]
    delete @_relationCache[key] for key, val of arguments[0]
  else if _.isString arguments[0]
    delete @_relationCache[arguments[0]]
  @

Relations::parse = (res) ->
  return res if _.isEmpty @attributes
  for key, klass of @relations()
    continue unless klass? and res[key]
    if klass::model
      @get(key).getOrAdd(obj.id).set(obj) for obj in res[key]
    else
      @get(key).set res[key]
    delete res[key]
  res

Relations::clear = ->
  @_relationCache = {}
  Backbone.Model::clear.apply @, arguments

Backbone.Relations = Relations.prototype
