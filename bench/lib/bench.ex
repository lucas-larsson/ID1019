defmodule Bench do
  @moduledoc """
  Documentation for `Bench`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Bench.hello()
      :world

  """
  def hello do
    :world
  end



  def bench() do bench(100) end

  def bench(l) do

    ls = [16,32,64,128,256,512,1024,2*1024,4*1024,8*1024]

    time = fn (i, f) ->
      seq = Enum.map(1..i, fn(_) -> :rand.uniform(100000) end)
      elem(:timer.tc(fn () -> loop(l, fn -> f.(seq) end) end),0)
    end

    bench = fn (i) ->

      list = fn (seq) ->
        List.foldr(seq, new_list(), fn (e, acc) -> list_insert(e, acc) end)
      end

      tree = fn (seq) ->
        List.foldr(seq, new_tree(), fn (e, acc) -> tree_insert(e, acc) end)
      end

      tl = time.(i, list)
      tt = time.(i, tree)

      IO.write("  #{tl}\t\t\t#{tt}\n")
    end

    IO.write("# benchmark of lists and tree (loop: #{l}) \n")
    Enum.map(ls, bench)

    :ok
  end

  def loop(0,_) do :ok end
  def loop(n, f) do
    f.()
    loop(n-1, f)
  end
end
