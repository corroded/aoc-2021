defmodule SubmarineTest do
  use ExUnit.Case
  doctest Submarine
  
  describe "#read_input" do
    assert Submarine.read_input("test.txt") == ["hello", "world"]
  end
end
