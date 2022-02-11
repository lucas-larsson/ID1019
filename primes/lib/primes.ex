defmodule Primes do
  @moduledoc """
  Documentation for `Primes`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Primes.hello()
      :world

  """
  def hello do
    :world
  end


  def bench() do
    ls=[16,32,64,128,256,512,1024,2*1024,4*1024,8*1024,16*1024,32*1024,64*1024,128*1024]
    Enum.each(ls, fn x ->  bench(x) end)
  end

  def bench(n) do
    IO.write('Runtime for 1 ')
    IO.inspect(elem(:timer.tc(fn -> Prime_1.prime(n) end),0))
    # IO.inspect(:timer.tc(fn -> Prime_1.prime(n) end))

    IO.write('Runtime for 2 ')
    IO.inspect(elem(:timer.tc(fn -> Prime_2.prime(n) end),0))
    # IO.inspect(:timer.tc(fn -> Prime_2.prime(n) end))

    IO.write('Runtime for 3 ')
    IO.inspect(elem(:timer.tc(fn -> Prime_3.prime(n) end),0))
    # IO.inspect(:timer.tc(fn -> Prime_3.prime(n) end))
    :ok
  end
end
