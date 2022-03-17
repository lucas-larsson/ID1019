defmodule Listt do

  #returns list containing first n elements
  def take(list, n) do
    Enum.take(list,n)
  end

  #returns list without its first n elements
  def drop(list, n) do
    Enum.drop(list,n)
  end

  def append(left,right) do
      Enum.concat(left,right)
  end


  def member(list, n) do
    Enum.member?(list,n)
  end

  def position([], _) do IO.puts("element does not exist") end
  def position([h|t], y) do
      cond do
          h == y -> 1                   # if it is the first element return 1
          true -> 1 + position(t, y)    # otherwise continuie treversing and incriminting till you find it.
      end
  end

end
