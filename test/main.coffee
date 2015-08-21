expect = require( "chai" ).expect
apikey = require "../index"

describe "apikey", ->

  beforeEach ->

  it "default key size is 40",  ->
    expect(apikey().length).to.equal 40

  it "generate key of given size",  ->
    expect(apikey(30).length).to.equal 30



