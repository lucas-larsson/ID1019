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
    IO.write(:wakadudle)
    IO.inspect(Prime_1.prime(n))
    IO.inspect(:timer.tc(fn -> Prime_1.prime(n) end))
    #IO.write(:timer.tc(fn -> Prime_2.prime(n) end))
    #IO.write(:timer.tc(fn -> Prime_3.prime(n) end))
    :ok
  end
end
