defmodule Prime_1  do

  def prime(n) do
    IO.write(:wakadudlelululul)
    list = [h|t] = Enum.to_list(2..n)
    IO.write(list)
    [h | remove(h,t)]

  end

  def remove(x, []) do [] end
  def remove(x, list = [h|t]) do
    [h|remove(h, Enum.filter(t, fn p -> rem(p, x) != 0 end))]
    # https://hexdocs.pm/elixir/1.13/Enum.html#product/1
    # Enum.reject([1, 2, 3], fn x -> rem(x, 2) == 0 end)
      #[1, 3]

  end


end
