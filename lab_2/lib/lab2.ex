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

@type literal() :: {:num, number()} | {:var, atom()}

@type expr() :: literal()
| {:add, expr(), expr()}
| {:mul, expr(), expr()}
| {:exp, expr(), literal()}
| {:ln, expr()}
| {:div, expr(), expr()}
| {:sqrt, expr()}
| {:sin, expr()}
| {:cos, expr()}

  def testMul() do
    e = {:add,
         {:mul, {:num, 2}, {:var, :x}},
          {:num, 4}}
       d = deriv(e, :x)
       c = calc(d, :x, 5)
       IO.write("Expression: #{pprint(e)}\n")
       IO.write("Derivative: #{pprint(d)}\n")
       IO.write("Simplified: #{pprint(simplify(d))}\n")
       IO.write("Calculated: #{pprint(simplify(c))}\n")
       :ok
  end
  def testExp() do
    e = {:add,
      {:exp, {:var, :x}, {:num, 3}},
      {:num, 4}}
      d = deriv(e, :x)
      c = calc(d, :x, 4)
      IO.write("Expression: #{pprint(e)}\n")
      IO.write("Derivative: #{pprint(d)}\n")
      IO.write("Simplified: #{pprint(simplify(d))}\n")
      IO.write("Calculated: #{pprint(simplify(c))}\n")
      :ok
  end

  def testLn() do
    e = {:ln, {:var, :x}}
    d = deriv(e, :x)
    #c = calc(d, :x, 4)

    # IO.inspect(c)

    IO.write("Expression: #{pprint(e)}\n")
    IO.write("Derivative: #{pprint(d)}\n")
    IO.write("Simplified: #{pprint(simplify(d))}\n")
      # getting error for some reason
    #IO.write("Calculated: #{pprint(simplify(c))}\n")
    :ok
  end

  def testDiv() do
    e = {:div, {:num, 5}, {:var, :x}}
    d = deriv(e, :x)
    c = calc(d, :x, 1)
    IO.write("expression: #{pprint(e)}\n")
    IO.write("derivative: #{pprint(d)}\n")
    IO.write("simplified: #{pprint(simplify(d))}\n")
    IO.write("calculated: #{pprint(simplify(c))}\n")
    :ok
  end

  def testSqrt() do
    e = {:sqrt, {:var, :x}}
    d = deriv(e, :x)
    c = calc(d, :x, 9)
    IO.write("expression: #{pprint(e)}\n")
    IO.write("derivative: #{pprint(d)}\n")
    IO.write("simplified: #{pprint(simplify(d))}\n")
    IO.write("calculated: #{pprint(simplify(c))}\n")
    :ok
  end

  def testSin() do
    e = {:sin, {:mul , {:exp, {:var, :x}, {:num, 2}}, {:num, 2}}}
    d = deriv(e, :x)
    c = calc(d, :x, 1)
    IO.write("expression: #{pprint(e)}\n")
    IO.write("derivative: #{pprint(d)}\n")
    IO.write("simplified: #{pprint(simplify(d))}\n")
    IO.write("calculated: #{pprint(simplify(c))}\n")
    :ok
  end


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

  def deriv({:exp, e, {:num, n}}, v) do
    {:mul,
        {:mul,
            {:num, n},
            {:exp,
                e,
                {:num, n - 1}}},
        deriv(e, v)
    }
  end

  def deriv({:ln, e}, v) do
    {:div, deriv(e,v), e}
  end

  def deriv({:div, e1, e2 }, v) do
    {:div,
        {:add,
            {:mul, deriv(e1, v), e2},
            {:mul,
              {:mul, e1, deriv(e2, v)},
              {:num, -1}}},
        {:exp, e2, {:num, 2}}
    }
  end

  def deriv({:sqrt, e}, v) do
    {:mul,
        {:div, {:num, 1},{:num,2}},
        {:mul,  deriv(e, v),
                {:div, {:num, 1}, {:sqrt, e}}
        }
    }
  end

  def deriv({:sin, e}, v) do
    {:mul, deriv(e, v), {:cos, e}}
  end

  def deriv({:cos, e}, v) do
    {:mul, deriv(e, v), {:sin, e}}
  end
  def calc({:num, n}, _, _) do {:num, n}  end
  def calc({:var, v}, v, n) do {:num, n}  end
  def calc({:var, v}, _, _) do {:var, v}  end
  def calc({:add, e1, e2}, v, n) do
    {:add, calc(e1, v, n), calc(e2, v, n)}
  end

  def calc({:mul, e1, e2}, v, n) do
    {:mul, calc(e1, v, n), calc(e2, v, n)}
  end

  def calc({:exp, e1, e2}, v, n) do
    {:exp, calc(e1, v, n), calc(e2, v, n)}
  end

  def calc({:div, e1, e2}, v, n) do
    {:div, calc(e1, v, n), calc(e2, v, n)}
  end

  def calc({:sqrt, e}, v, n) do
    {:sqrt, calc(e, v, n)}
  end

  def calc({:sin, e}, v, n) do
    {:sin, calc(e, v, n)}
  end

  def calc({:cos, e}, v, n) do
    {:cos, calc(e, v, n)}
  end




  def simplify({:add, e1, e2}) do
    simplify_add(
      simplify(e1),
      simplify(e2)
    )
  end

  def simplify({:mul, e1, e2}) do
    simplify_mul(
      simplify(e1),
      simplify(e2)
    )
  end

  def simplify({:exp, e1, e2}) do
    simplify_exp(
      simplify(e1),
      simplify(e2)
    )
  end

  def simplify({:div, e1, e2}) do
    simplify_div(
      simplify(e1),
      simplify(e2)
    )
  end

  def simplify({:sqrt, e}) do
    simplify_sqrt(
      simplify(e)
   )
  end

  def simplify({:sin, e}) do
    simplify_sin(
      simplify(e)
    )
  end

  def simplify({:cos, e}) do
    simplify_cos(
      simplify(e)
    )
  end

  @spec simplify(any) :: any
  def simplify(e) do e end


  def simplify_add({:num, 0}, e) do e end
  def simplify_add( e, {:num, 0}) do e end
  def simplify_add({:num, y}, {:num,x}) do {:num, x + y } end
  def simplify_add(e1, e2) do {:add, e1, e2} end
  def simplify_mul({:num, 0}, _) do {:num, 0 } end
  def simplify_mul(_, {:num, 0}) do {:num, 0 }end
  def simplify_mul({:num, 1}, e ) do e end
  def simplify_mul( e, {:num, 1}) do e end
  def simplify_mul({:num, x}, {:num, y}) do  {:num , x * y }  end
  def simplify_mul(e1, e2) do {:mul, e1, e2} end

  def simplify_exp( _ , {:num, 0}) do {:num, 1} end
  def simplify_exp( e1, {:num, 1}) do e1 end
  def simplify_exp({:num, n1}, {:num, n2}) do {:num, :math.pow(n1,n2)} end
  def simplify_exp( e1, e2 ) do {:exp, e1, e2} end

  def simplify_div(e1, {:num, 1}) do {:num, e1} end
  def simplify_div({:num, 0}, _) do {:num, 0} end
  def simplify_div({:num, n1},{:num, n2}) do {:num, n1/n2} end
  def simplify_div(e1, e2) do {:div, e1, e2} end

  def simplify_sqrt({:num, 0}) do {:num, 0} end
  def simplify_sqrt({:num, 1}) do {:num, 1} end
  def simplify_sqrt({:num, n}) do {:num, :math.sqrt(n)} end
  def simplify_sqrt(e) do {:sqrt, e} end


  def simplify_sin({:num, n}) do {:num, :math.sin(n)} end
  def simplify_sin(e) do {:sin, e} end

  def simplify_cos({:num, n}) do {:num, :math.cos(n)} end
  def simplify_cos(e) do {:cos, e} end


  def pprint({:num, n}) do "#{n}" end
  def pprint({:var, v}) do "#{v}" end
  def pprint({:add, e1, e2}) do
  "(#{pprint(e1)} + #{pprint(e2)})"
  end

  def pprint({:mul, e1, e2}) do
  "#{pprint(e1)} * #{pprint(e2)}"
  end

  def pprint({:exp, e1, e2})  do
  "(#{pprint(e1)})ˆ(#{pprint(e2)})"
  end

  def pprint({:div, e1, e2})  do
  "(#{pprint(e1)})/(#{pprint(e2)})"
  end

  def pprint({:ln, e})  do
  "ln(#{pprint(e)})"
  end

  def pprint({:sqrt, e}) do
    "√#{pprint(e)}"
  end

  def pprint({:sin, e}) do
    "√Sin#{pprint(e)}"
  end

  def pprint({:cos, e}) do
    "Cos#{pprint(e)}"
  end


end
