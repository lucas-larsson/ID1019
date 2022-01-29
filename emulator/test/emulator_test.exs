defmodule EmulatorTest do
  use ExUnit.Case
  doctest Emulator

  test "greets the world" do
    assert Emulator.hello() == :world
  end
end
