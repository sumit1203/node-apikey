# Calculate the Shannon entropy of a string in bits per symbol.

process = ( s, evaluator ) ->
  h = {}
  s = s.split '' if typeof s == "string"
  for c in s
    h[ c ] = 0 unless h[ c ]?
    h[ c ]++

  evaluator k, h[ k ] for own k of h if evaluator?

  h

# Measure the entropy of a string in bits per symbol.
entropy = ( s ) ->
  sum = 0
  len = s.length
  log2 = Math.log( 2 )
  process s, ( k, f ) ->
    p = f / len
    sum -= p * Math.log( p ) / log2

  sum

# Measure the entropy of a string in total bits.
bits = ( s ) -> entropy( s ) * s.length

module.exports =
  bitsPerSymbol : entropy
  totalBits : bits

