defmodule Encode do

  def encode(text) do
    encode(text,encode_table(),[])
  end
  def encode([],_, coded) do Enum.reverse(coded) end
  def encode([char|text],table, sofar) do
  encode(text,table, encode_lookup(char, table) ++[32] ++ sofar)
  end

  def codes(:nil, _) do [] end
  def codes({:node,:na, long,short},code) do
    codes(long,[?-|code]) ++ codes(short,[?.|code])
  end
  def codes({:node,char,long,short},code) do
    [{char,code}]++ codes(long,[?-|code]) ++ codes(short,[?.|code])
  end

  def encode_lookup(char,[{char, code} | _]) do code  end
  def encode_lookup(char,[_ | rest]) do encode_lookup(char,rest) end
  def encode_lookup(char, map) do Map.get(map, char) end


  def encode_table() do
    codes = codes(Morse.morse(),[])
    Enum.reduce(codes, %{},fn({char,code },acc) -> Map.put(acc,char,code)end)
  end

end
