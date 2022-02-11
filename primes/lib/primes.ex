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

  def bench(n) do
    IO.write('Runtime for 1 ')
    IO.inspect(elem(:timer.tc(fn -> Prime_1.prime(n) end),0))
     IO.inspect(:timer.tc(fn -> Prime_1.prime(n) end))

    IO.write('Runtime for 2 ')
    IO.inspect(elem(:timer.tc(fn -> Prime_2.prime(n) end),0))
    IO.inspect(:timer.tc(fn -> Prime_2.prime(n) end))

    IO.write('Runtime for 3 ')
    IO.inspect(elem(:timer.tc(fn -> Prime_3.prime(n) end),0))
    IO.inspect(:timer.tc(fn -> Prime_3.prime(n) end))
    # Primes.bench(456)

    :ok
  end
end
