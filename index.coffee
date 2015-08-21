crypto = require 'crypto'
basejump = require "basejump"

# see: http://stackoverflow.com/questions/9407892/how-to-generate-random-sha1-hash-to-use-as-id-in-node-js
cache = {}

#compute number of bytes needed to hold a 62^size number
bytes = ( size = 40 ) ->
  throw "bad size" if size < 1
  return cache[ size ] if cache[ size ]?
  cache[ size ] = Math.ceil( Math.log( Math.pow( 62, size ) ) / Math.log( 2 ) / 8 )

module.exports = ( size = 40 ) ->
  b = bytes( size )
  basejump.toBase62 crypto.randomBytes( b ).toJSON().data, size



