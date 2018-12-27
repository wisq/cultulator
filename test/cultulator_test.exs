defmodule CultulatorTest do
  use ExUnit.Case
  doctest Cultulator

  test "greets the world" do
    assert Cultulator.hello() == :world
  end
end
