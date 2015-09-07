crypto = require "crypto"

base62 = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

module.exports = ( size = 40 ) ->
  throw new Error( "bad size" ) if size < 1
  key = ""
  bytes = crypto.randomBytes( size * 3 )
  j = 0
  while key.length < size
    if j >= bytes.length
      bytes = crypto.randomBytes( size )
      j = 0
    while bytes[ j ] >= 62
      j++
      if j >= bytes.length
        bytes = crypto.randomBytes( size )
        j = 0
    throw new Error( "internal error" ) if j >= bytes.size
    key += base62[ bytes[ j++ ] ]

  key


