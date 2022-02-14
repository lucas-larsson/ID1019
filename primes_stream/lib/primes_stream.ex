defmodule PrimesStream do
  @moduledoc """
  Documentation for `PrimesStream`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> PrimesStream.hello()
      :world

  """
  def hello do
    :world
  end

  def z(n) do
    IO.inspect(:Z )
    fn -> {n, z(n + 1)} end
  end

  # Takes in a function and a number and filters until the next number not devideable by f
  def filter(fun, f) do
    IO.inspect(fun )
    {current, new_fun} = fun.()
    IO.inspect("filter" )
    IO.inspect(f)
    IO.inspect(current)
    case rem(current, f) do
      0 ->
        filter(new_fun, f)
      _ ->
        {current, fn -> filter(new_fun, f) end}
    end
  end

  def sieve(n, p) do
    IO.inspect(:sieve )
    IO.inspect(n)
    {next_number, fun} = filter(n,p)
    {next_number, fn -> filter(fun,next_number) end}
    # {next_number, fn -> sieve(fun, p) end}
  end

  def primes() do
     IO.inspect(:primes)
    fn ->
      {2, fn -> sieve( fn -> z(3) end, 2) end}
    end
  end

end
