expect = require( "chai" ).expect
apikey = require( "../index" ).apikey

describe "apikey", ->

  it "default key size is 40", ->
    expect( apikey().length ).to.equal 40

  it "specify size", ->
    expect( apikey( 90 ).length ).to.equal 90

  it "reject bad size", ->
    expect( -> apikey( -10 ) ).to.throw( Error )



