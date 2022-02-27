defmodule Encode do
    # Build the encoding table.
  def encode_table(tree) do
    #codes(tree, [])
    # codes_better(tree, [], [])
    Enum.sort( codes_better(tree, [], []), fn({_,x},{_,y}) -> length(x) < length(y) end)
  end
  # Traverse the Huffman tree and build a binary encoding
  # for each character.
  def codes({a, b}, sofar) do
    as = codes(a, [0 | sofar])
    bs = codes(b, [1 | sofar])
    as ++ bs
  end
  def codes( a, code) do
    [{a, Enum.reverse(code)}]
  end

  # A better travering of the tree
  def codes_better({a, b}, sofar, acc) do
    left = codes_better(a, [0 | sofar], acc)
    codes_better(b, [1 | sofar], left)
  end
  def codes_better(a, code, acc) do
    [{a, Enum.reverse(code)} | acc]
  end

    ## An alternative way of representing the encode table.

  def encode_tuple(tree) do
    codes = codes(tree, [])
    sorted = Enum.sort(codes, fn({x,_}, {y,_}) ->  x < y end)
    extended = extend_codes(sorted, 0)
    List.to_tuple(extended)
  end
  def extend_codes([], _) do [] end
  def extend_codes([{n,code}|rest], n) do [code | extend_codes(rest, n+1)] end
  def extend_codes(codes, n) do [ [] | extend_codes(codes, n+1)] end
  def encode_tuple([], _), do: []
  def encode_tuple([char | rest], table) do
     code = elem(table, char)
     code ++ encode_tuple(rest, table)
  end
  ## An improvement where we do not waste any stack space
  #def encode_tuple(text, table) do
  #   encode_tuple(text, table, [])
  #end
  def encode_tuple([], _, acc) do flattenr(acc, []) end
  def encode_tuple([char | rest], table, acc) do
    code = elem(table, char)
    encode_tuple(rest, table, [code | acc])
  end
  def flattenr([], acc) do acc end
  def flattenr([code|rest], acc) do
    # this could further be improved if we didn't reverse the code
    flattenr(rest, code ++ acc)
  end
  # if code was stored in the reveresed order
  def add([], acc) do acc end
  def add([b|rest], acc) do
    add(rest, [b|acc])
  end
  # Parse a string of text and encode it with the
  # previously generated encoding table.
  def encode([], _), do: []
  def encode([char | rest], table) do
    {_, code} = List.keyfind(table, char, 0)
    code ++ encode(rest, table)
  end



end
