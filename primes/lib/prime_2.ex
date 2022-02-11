defmodule Prime_2  do

  def prime(n) do
    list = Enum.to_list(2..n)
    prime(list,[])
  end
  def prime(list, primes) do
    case list do
      [] -> primes
      [h|t] ->
        bool = checkPrime(list, primes)
        primes = insert(bool, h, primes)
        prime(t, primes)
    end

  end

  def checkPrime(_, []) do true end
  def checkPrime([h|t], [h2|t2]) do
    cond do  (rem(h,h2) == 0) ->
        false
        true -> checkPrime([h|t], t2)
    end
  end

  def insert(bool, x, primes) do
    case bool do
      true -> primes ++ [x]
      false -> primes
    end
  end
  
end
