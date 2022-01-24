defmodule Lab1 do
  @moduledoc """
  Documentation for `Lab1`.
  """

  @spec hello :: :hello_world
  @doc """
  Hello world.

  ## Examples

      iex> Lab1.hello()
      :world

  """
  def hello do
    :hello_world
  end

 # Compute m to the power of n
 @spec exp(any, non_neg_integer) :: any
 def exp(_ , 0) do 1 end
 def exp(m , 1) do m end
 def exp(m , n) do prod( m ,exp(m, n - 1))end

 # Compute the product of x and y using recursion
 @spec prod(number, any) :: any
 def prod(0, _ ) do 0 end
 # this case is not needed
 # def prod(1 , x ) do x end
 def prod( x , y ) do
    # print tp CLI for debugging
      IO.puts(x)
      IO.puts(y)
   x + prod( y - 1 , x)
end

 # Compute the double of a number
 @spec double(number) :: number
 def double (x)do
   x * 2
 end

 # Compute from F to C
 @spec fer_c(number) :: float
 def fer_c (x) do
   (x - 32) / 1.8
 end

 # Compute from C to F
 @spec c_fer(number) :: float
 def c_fer (x) do
   x  * 1.8 + 32
 end

 # Compute x +3
 @spec p3(number) :: number
 def p3 (x)do
   x+3

 end

# Compute x - 3
 @spec m3(number) :: number
 def m3(x) do
   x-3

 end

end
