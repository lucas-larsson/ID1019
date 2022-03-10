defmodule Mandel do
  def mandelbrot(width, height, x, y, k, depth) do
    trans = fn(w,h) ->
      Cmplx.new(x + k * (w - 1), y - k * (h - 1))
    end
    rows(width, height, trans, depth, [])
  end
  def rows(_, 0, _, _, res), do: res
  def rows(w, h, trans, max_depth, res) do
    row = build_row(w, h, w, h, trans, max_depth, [])
    rows(w,h-1,trans,max_depth, [row|res])
  end
  defp build_row(0, _, _, _, _, _, acc), do: acc
  defp build_row(x, y, w, h, trans, max_depth, acc) do
    c = trans.(x,y)
    depth = Brot.mandelbrot(c, max_depth)
    color = Color.convert(depth, max_depth)
    build_row(x-1, y, w, h, trans, max_depth, [color|acc])
  end
end