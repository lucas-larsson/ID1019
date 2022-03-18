defmodule MorseTest do
  use ExUnit.Case
  doctest Morse

  test "greets the world" do
    assert Morse.hello() == :world
  end
end
