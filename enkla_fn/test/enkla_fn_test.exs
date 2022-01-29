defmodule EnklaFnTest do
  use ExUnit.Case
  doctest EnklaFn

  test "greets the world" do
    assert EnklaFn.hello() == :world
  end
end
