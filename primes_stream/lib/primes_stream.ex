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
    {current, new_fun} = fun.()
    case rem(current, f) do
      0 ->
        filter(new_fun, f)
      _ ->
        {current, fn -> filter(new_fun, f) end}
    end
  end

  def sieve(n, p) do
    {next_number, fun} = filter(n,p)
     {next_number, fn -> sieve(fun, next_number) end}
  end

  def primes() do
    fn ->
      {2, fn ->
         sieve(z(3), 2) end
        }
    end
  end

end
