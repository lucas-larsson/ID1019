defmodule Decode do

  # Decode a string of text using the same encoding
  # table as above. This is a shortcut and an
  # unrealistic situation.

  def decode_table(tree), do: Encode.codes(tree, [])

  def decode([], _), do: []
  def decode(seq, table) do
    {char, rest} = decode_char(seq, 1, table)
    [char | decode(rest, table)]
  end

  def decode_char(seq, n, table) do
    {code, rest} = Enum.split(seq, n)
    case List.keyfind(table, code, 1) do
      {char, _} ->
        {char, rest}

      nil ->
        decode_char(seq, n + 1, table)
    end
  end


  # # The decoder using the tree. This is a more realistic
  # # solution.

   # def decode_table(tree) do tree end

   # def decode(seq, tree) do
   #   decode(seq, tree, tree)
   # end

  def decode([], char, _)  do
    [char]
  end

  def decode([0 | seq], {left, _}, tree) do
    decode(seq, left, tree)
  end
  def decode([1 | seq], {_, right}, tree) do
    decode(seq, right, tree)
  end
  def decode(seq, char, tree) do
    [char | decode(seq, tree, tree)]
  end



end
