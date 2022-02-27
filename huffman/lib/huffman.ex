defmodule Huffman do
  @moduledoc """
  Documentation for `Huffman`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Huffman.hello()
      :world

  """
  def hello do
    :world
  end
    # A sampel text contaaining all charecters to be encoded.
  def sample do
    'the quick brown fox jumps over the lazy dog å ä ö'
  end
  def text, do: 'this is something that we should encode'

  # Run all the steps of Huffman encoding and decoding.
  def test do
    sample = sample()
    tree = tree(sample)
    encode = Encode.encode_tuple(tree)
    decode = Decode.decode_table(tree)
    text = text()
    seq = Encode.encode_tuple(text, encode)
    Decode.decode(seq, decode)
  end

  # Construct the Huffman tree from a text sample.
  def tree(sample) do
    freq = Freq.freq(sample)
    huffman(freq)
  end

  # Build the actual Huffman tree inserting a character at
  # time based on the frequency.
  def huffman(freq) do
    sorted = Enum.sort(freq, fn({_, x}, {_, y}) -> x < y end)
    huffman_tree(sorted)
  end


  def huffman_tree([{tree, _}]), do: tree
  def huffman_tree([{a, af}, {b, bf} | rest]) do
    huffman_tree(insert({{a, b}, af + bf}, rest))
  end

  def insert({a, af}, []), do: [{a, af}]
  def insert({a, af}, [{b, bf} | rest]) when af < bf do
    [{a, af}, {b, bf} | rest]
  end
  def insert({a, af}, [{b, bf} | rest]) do
    [{b, bf} | insert({a, af}, rest)]
  end




end
