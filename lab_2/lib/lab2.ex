defmodule Lab2 do
  @moduledoc """
  Documentation for `Lab2`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Lab2.hello()
      :world

  """
  def hello do
    :world
  end


def pprint({:num, n}) do "#{n}" end

def pprint({:var, v}) do "#{v}" end

def pprint({:add, e1, e2}) do
   "#{pprint(e1)} +  #{pprint(e2)}"
  end

@type literal() :: {:num, number()} | {:var, atom()}

@type expr() :: literal()
| {:add, expr(), expr()}
| {:mul, expr(), expr()}


  def deriv({:num, _ }, _ ) do {:num, 0} end

  def deriv({:var, v}, v) do {:num, 1} end

  # anything besides " v " because it is mentioned in the function before
  def deriv({:var, _}, _) do {:num, 0} end

  def deriv({:add, e1, e2}, v) do
    {:add, deriv(e1, v), deriv(e2, v)}

  end

  def deriv({:mul, e1, e2}, v) do
    {:add,
     {:mul, deriv(e1, v), e2 },
     {:mul, e1, deriv(e2, v)}
    }

  end



end
