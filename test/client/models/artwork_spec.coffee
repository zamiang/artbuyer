require "#{process.cwd()}/test/helpers/client_helper.coffee"

describe 'Artwork', ->

  artwork = null

  beforeEach ->
    artwork = new App.Models.Artwork fabricate 'artwork'

  describe '#save', ->

    it 'will send a publish API request', ->
      artwork.save { published: true, private: false }
      jqLastAjaxRequest.url.should.include "/artwork/"
      JSON.parse(jqLastAjaxRequest.data).published.should.equal true
      JSON.parse(jqLastAjaxRequest.data).private.should.equal false
      jqLastAjaxRequest.type.should.equal 'PUT'

    it 'will send an unpublish API request to artwork update API', ->
      artwork.save { published: false, private: true }
      jqLastAjaxRequest.url.should.include "/artwork/"
      JSON.parse(jqLastAjaxRequest.data).published.should.equal false
      JSON.parse(jqLastAjaxRequest.data).private.should.equal true
      jqLastAjaxRequest.type.should.equal 'PUT'

  describe '#gravityUrl', ->
    it 'links to gravity', ->
      artwork.gravityUrl().should.include "/artwork/#{artwork.get('id')}"
