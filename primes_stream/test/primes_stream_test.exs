defmodule PrimesStreamTest do
  use ExUnit.Case
  doctest PrimesStream

  test "greets the world" do
    assert PrimesStream.hello() == :world
  end
end
