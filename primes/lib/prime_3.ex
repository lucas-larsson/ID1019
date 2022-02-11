defmodule Prime_3  do

 def prime(n) do
   list = Enum.to_list(2..n)
   prime(list,[])
 end
 def prime(list, primes) do
   case list do
     [] -> Enum.reverse(primes)
     [h|t] ->
       bool = Prime_2.checkPrime(list, primes)
       primes = insert(bool, h, primes)
       prime(t, primes)
   end
 end
 def insert(bool, x, primes) do
   case bool do
     true ->  [x|primes] #improper 
     false -> primes
   end
 end

end
