defmodule Fractals do
  @moduledoc """
  Documentation for `Fractals`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Fractals.hello()
      :world

  """
  def hello do
    :world
  end

  def demo do
    IO.puts("Writing demo image to file...")
    small(-2.6, 1.2, 1.2)
    # small(-5, 6, 5)
  end

  def small(x0, y0, xn) do
    width = 900
    height = 700
    depth = 64
    k = (xn - x0) / width
    image = Mandel.mandelbrot(width, height, x0, y0, k, depth)
    PPM.write("small.ppm", image)
  end
end
