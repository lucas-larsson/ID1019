defmodule Moves do

  def single({:one, n}, {main, one, two}) do
      cond do
          length(main) - n < 0 ->
              {main, one, two}
          n < 0 ->
              {Train.append(main, Train.take(one, n * -1)), Train.drop(one, n * -1), two}
          n > 0 ->
              {Train.take(main, length(main)-n), Train.append(Train.drop(main, length(main)-n), one), two}
          true -> {main, one, two}
      end
  end


  def single({:two, n}, {main, one, two}) do
      cond do
          length(main) - n < 0 ->
              {main, one, two}
          n < 0 ->
              {Train.append(main, Train.take(two, n*-1)), one, Train.drop(two, n*-1)}
          n > 0 ->
              {Train.take(main, length(main)-n), one, Train.append(Train.drop(main, length(main)-n), two)}
          true -> {main, one, two}
      end
  end

  def move(moves, state) do
      case moves do
          [] -> [state]
          [h|t] -> [state | move(t, single(h, state))]
      end
  end
end
