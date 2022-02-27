defmodule Bench do

  # This is the benchmark of the single operations in the
  # Huffman encoding and decoding process.

  def bench(file, n) do
    {text, b} = read(file, n)
    c = length(text)
    {tree, t2} = time(fn -> Huffman.tree(text) end)
    {encode, t3} = time(fn -> Encode.encode_table(tree) end)
    s = length(encode)
    {decode, _} = time(fn -> Decode.decode_table(tree) end)
    {encoded, t5} = time(fn -> Encode.encode(text, encode) end)
    e = div(length(encoded), 8)
    r = Float.round(e / b, 3)
    {_, t6} = time(fn -> Decode.decode(encoded, decode) end)

    IO.puts("text of #{c} characters")
    IO.puts("tree built in #{t2} ms")
    IO.puts("table of size #{s} in #{t3} ms")
    IO.puts("encoded in #{t5} ms")
    IO.puts("decoded in #{t6} ms")
    IO.puts("source #{b} bytes, encoded #{e} bytes, compression #{r}")
  end

  # Measure the execution time of a function.
  def time(func) do
    initial = Time.utc_now()
    result = func.()
    final = Time.utc_now()
    {result, Time.diff(final, initial, :microsecond) / 1000}
  end

 # Get a suitable chunk of text to encode.
  def read(file, n) do
   {:ok, fd} = File.open(file, [:read, :utf8])
    binary = IO.read(fd, n)
    File.close(fd)

    length = byte_size(binary)
    case :unicode.characters_to_list(binary, :utf8) do
      {:incomplete, chars, rest} ->
        {chars, length - byte_size(rest)}
      chars ->
        {chars, length}
    end
  end

  def banch(file, n) do
    {text, b} = read(file, n)
    c = length(text)
    {tree, t2} = time(fn -> Huffman.tree(text) end)
    {encode, t3} = time(fn -> Encode.encode_tuple(tree) end)
    s = tuple_size(encode)
    {decode, _} = time(fn -> Decode.decode_table(tree) end)
    {encoded, t5} = time(fn -> Encode.encode_tuple(text, encode) end)
    e = div(length(encoded), 8)
    r = Float.round(e / b, 3)
    {_, t6} = time(fn -> Decode.decode(encoded, decode) end)

    IO.puts("text of #{c} characters")
    IO.puts("tree built in #{t2} ms")
    IO.puts("table of size #{s} in #{t3} ms")
    IO.puts("encoded in #{t5} ms")
    IO.puts("decoded in #{t6} ms")
    IO.puts("source #{b} bytes, encoded #{e} bytes, compression #{r}")
  end



end
