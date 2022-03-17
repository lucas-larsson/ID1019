defmodule Train do
  @moduledoc """
  Documentation for `TrainShunting`.
  """

  @doc """
  Hello world.

  Examples

      iex> TrainShunting.hello()
      :world

  """
  def hello do
    :world
  end

  def split(list, atom) do
    case List.member(list, atom) do
        false -> :no_split
        true -> {List.take(list, List.position(list, atom)-1),
         List.drop(list, List.position(list, atom))}
    end
  end


 # +1 for length of y
 def find(xs, ys) do
     case ys do
         [] -> []
         [y|t] ->
             {hs, ts} = split(xs, y)
             step = Moves.single({:one, length(ts)+1}, {xs, [], []})
             step = Moves.single({:two, length(hs)}, step)
             step = Moves.single({:one, -(length(ts)+1)}, step)
             {[_|t2], [], []} = Moves.single({:two, -(length(hs))}, step)

             [{:one, length(ts)+1}, {:two, length(hs)}, {:one, -(length(ts)+1)}, {:two, -(length(hs))}| find(t2, t)]
     end
 end

 def few([u|k], [u|t]) do few(k, t) end
 def few(xs, ys) do
     case ys do
         [] -> []
         [y|t] ->
             {hs, ts} = split(xs, y)
             step = Moves.single({:one, length(ts)+1}, {xs, [], []})
             step = Moves.single({:two, length(hs)}, step)
             step = Moves.single({:one, -(length(ts)+1)}, step)
             {[_|t2], [], []} = Moves.single({:two, -(length(hs))}, step)

             [{:one, length(ts)+1}, {:two, length(hs)}, {:one, -(length(ts)+1)}, {:two, -(length(hs))}| few(t2, t)]
     end
 end

end
