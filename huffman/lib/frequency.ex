defmodule Freq do

  # Compute the frequencies of all the characters in the
  # sample text and return a list of tuples {char, freq}. where char is the number represinting the charechter from the assci table
  def freq(sample), do: freq(sample, [])


  def freq([], freq), do: freq
  def freq([char | rest], freq) do
    freq(rest, update(char, freq))
  end

  def update(char, []), do: [{char, 1}]
  def update(char, [{char, n} | freq]) do
    [{char, n + 1} | freq]
  end
  def update(char, [elem | freq]) do
    [elem | update(char, freq)]
  end

end
