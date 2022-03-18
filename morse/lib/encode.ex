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

  # def codes do
  #   [{32, '..--'},
  #    {37,'.--.--'},
  #    {44,'--..--'},
  #    {45,'-....-'},
  #    {46,'.-.-.-'},
  #    {47,'.-----'},
  #    {48,'-----'},
  #    {49,'.----'},
  #    {50,'..---'},
  #    {51,'...--'},
  #    {52,'....-'},
  #    {53,'.....'},
  #    {54,'-....'},
  #    {55,'--...'},
  #    {56,'---..'},
  #    {57,'----.'},
  #    {58,'---...'},
  #    {61,'.----.'},
  #    {63,'..--..'},
  #    {64,'.--.-.'},
  #    {97,'.-'},
  #    {98,'-...'},
  #    {99,'-.-.'},
  #    {100,'-..'},
  #    {101,'.'},
  #    {102,'..-.'},
  #    {103,'--.'},
  #    {104,'....'},
  #    {105,'..'},
  #    {106,'.---'},
  #    {107,'-.-'},
  #    {108,'.-..'},
  #    {109,'--'},
  #    {110,'-.'},
  #    {111,'---'},
  #    {112,'.--.'},
  #    {113,'--.-'},
  #    {114,'.-.'},
  #    {115,'...'},
  #    {116,'-'},
  #    {117,'..-'},
  #    {118,'...-'},
  #    {119,'.--'},
  #    {120,'-..-'},
  #    {121,'-.--'},
  #    {122,'--..'}]
  # end

end
