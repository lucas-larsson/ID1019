defmodule Color do
  def convert(depth, max) do
    #0..255 is rgb range
    float = (depth/max) * 4
    x = trunc(float)
    y = trunc(255 * (float-x))
    case x do
      0 -> {y, 0, 0}
      1 -> {255, y, 0}
      2 -> {255 - y, 255, 0}
      3 -> {0, 255, y}
      4 -> {0, 255 - y, 255}
    end

  end
end