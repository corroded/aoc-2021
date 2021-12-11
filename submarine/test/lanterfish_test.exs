defmodule SubmarineLanternfishTest do
  use ExUnit.Case

  alias Submarine.Lanternfish, as: Lanternfish

  describe "#count" do
    setup [:with_example_txt]

    test "returns the count of lanterfish in x days", context do
      assert Lanternfish.count(context[:input], 18) == 26
      assert Lanternfish.count(context[:input], 80) == 5934
    end
  end

  describe "#propagate" do
    test "it decreases internal timer of each fish" do
      assert Lanternfish.propagate([3,4,3,1,2], 1, 1) == [2,3,2,0,1]
    end

    test "it increases fish for each 0 in it" do
      assert (Lanternfish.propagate([2,3,2,0,1], 1, 1) -- [1,2,1,6,0,8]) == []
      assert (Lanternfish.propagate([0,1,0,5,6,7,8], 1, 1) -- [6,0,6,4,5,6,7,8,8]) == []
    end

    test "it still works with multiple days" do
      assert (Lanternfish.propagate([3,4,3,1,2], 1, 2) -- [1,2,1,6,0,8]) == []
      assert (Lanternfish.propagate([3,4,3,1,2], 1, 7) -- [3,4,3,1,2,3,4,5,5,6]) == []
      assert (Lanternfish.propagate([3,4,3,1,2], 1, 18) -- [6,0,6,4,5,6,0,1,1,2,6,0,1,1,1,2,2,3,3,4,6,7,8,8,8,8]) == []
    end
  end

  defp with_example_txt(_) do
    {:ok, [input: Submarine.read_line("test/fixtures/day6.txt", true)]}
  end
end
