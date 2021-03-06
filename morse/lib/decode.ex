defmodule Decode do

  def decode(signal) do
    table = decode_table()
    decode(signal, table, [])
  end

  def decode([], _, acc) do Enum.reverse(acc) end
  def decode(signal, table , acc) do
    {char, rest} = decode_char(signal,table)
    decode(rest, table,[char|acc])
  end

  def decode_table() do
    Morse.morse()
  end

  def decode_char(signal) do
    table = decode_table()
    decode_char(signal,table)
  end
  def decode_char([],{:node, char, _, _}) do {char,[]} end

  def decode_char([?-|signal], {:node, _, long, _}) do
    decode_char(signal, long)
  end
  def decode_char([?.| signal], {:node, _,_, short}) do
    decode_char(signal,short)
  end

  def decode_char([?\s|signal], {:node,:na , _, _ }) do
  {?*,signal}
  end
  def decode_char([?\s|signal], {:node,char , _, _ }) do
    {char,signal}
  end

end
