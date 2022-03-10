defmodule Cmplx do
  def new(r, i) do
    {r, i}
  end
  def add({r, i}, {r2, i2}) do
    {(r+r2), (i+i2)}
  end
  def sqr({r, i}) do
    real = (r * r) + (i*i) * (-1)
    im = 2*(r*i)
    {real, im}
  end
  def abs({r, i}) do
    :math.sqrt((r*r)+(i*i))
  end
end
