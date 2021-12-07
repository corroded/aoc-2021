defmodule SubmarineUtilsTest do
  use ExUnit.Case

  describe "#transpose" do
    test "returns a list of the each of the elements of a list of list" do
      lists = [
        "1234",
        "abcd",
        "wxyz",
      ]

      assert Submarine.Utils.transpose(lists) == [
        ["1", "a", "w"],
        ["2", "b", "x"],
        ["3", "c", "y"],
        ["4", "d", "z"]
      ]
    end

    test "returns transposed list based on delimiter" do
      lists = [
        "1 2 3   4",
        "a b c d",
        "w  x y z",
      ]

      assert Submarine.Utils.transpose(lists, " ") == [
        ["1", "a", "w"],
        ["2", "b", "x"],
        ["3", "c", "y"],
        ["4", "d", "z"]
      ]
    end
  end
end
