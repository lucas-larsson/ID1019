defmodule Moves do

  def single({:one, n}, {main, one, two}) do
      cond do
          length(main) - n < 0 ->
              {main, one, two}
          n < 0 ->
              {List.append(main, List.take(one, n * -1)), List.drop(one, n * -1), two}
          n > 0 ->
              {List.take(main, length(main)-n), List.append(List.drop(main, length(main)-n), one), two}
          true -> {main, one, two}
      end
  end


  def single({:two, n}, {main, one, two}) do
      cond do
          length(main) - n < 0 ->
              {main, one, two}
          n < 0 ->
              {List.append(main, List.take(two, n * -1)), one, List.drop(two, n* -1)}
          n > 0 ->
              {List.take(main, length(main)-n), one, List.append(List.drop(main, length(main)-n), two)}
          true -> {main, one, two}
      end
  end

  def move([], state) do [state] end
  
  def move([h|t], state) do
    [state | move(t, single(h, state))]
    end

end
