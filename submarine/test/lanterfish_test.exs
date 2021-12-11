defmodule SubmarineLanternfishTest do
  use ExUnit.Case

  describe "#count" do
    setup [:with_example_txt]

    test "returns the count of lanterfish in x days", context do
      assert Submarine.Lanternfish.count(context[:input], 18) == 26
      assert Submarine.Lanternfish.count(context[:input], 80) == 5934
    end
  end

  defp with_example_txt(_) do
    {:ok, [input: Submarine.read_input("test/fixtures/day6.txt")]}
  end
end
