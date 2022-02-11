defmodule Prime_1  do

  def prime(n) do
    [h|t] = Enum.to_list(2..n)
    [h | remove(h,t)]

  end

  def remove(_, []) do [] end
  def remove(x,[h|t]) do
    [h|remove(h, Enum.filter(t, fn p -> rem(p, x) != 0 end))]
    # Enum.reject([1, 2, 3], fn x -> rem(x, 2) == 0 end)
      #[1, 3]
  end

end
