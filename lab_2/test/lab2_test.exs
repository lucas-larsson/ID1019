defmodule Lab2Test do
  use ExUnit.Case
  doctest Lab2

  test "greets the world" do
    assert Lab2.hello() == :world
  end
end
