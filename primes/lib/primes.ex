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
    # IO.write(:wakadudle11111)
    # IO.inspect(Prime_1.prime(n))
    # IO.inspect(elem(:timer.tc(fn -> Prime_1.prime(n) end),0))
     IO.inspect(:timer.tc(fn -> Prime_1.prime(n) end))

    IO.write(:wakad222222)
    # IO.inspect(elem(:timer.tc(fn -> Prime_2.prime(n) end),0))
    IO.inspect(:timer.tc(fn -> Prime_2.prime(n) end))
    # IO.inspect(elem(:timer.tc(fn -> Prime_3.prime(n) end),0))
    :ok
  end
end

