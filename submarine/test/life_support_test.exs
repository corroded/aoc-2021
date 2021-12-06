defmodule SubmarineLifeSupportTest do
  use ExUnit.Case

  describe "#oxygen_generator_rating" do
    setup [:with_example_txt]

    test "returns rating in decimal", context do
      assert Submarine.LifeSupport.oxygen_generator_rating(context[:bits]) == 23
    end
  end

  describe "#filter_at_position" do
    setup [:with_example_txt]

    test "returns a list filtered by most common bits at position 0", context do
      assert Submarine.LifeSupport.filter_at_position(context[:bits], 0) == [
        "11110",
        "10110",
        "10111",
        "10101",
        "11100",
        "10000",
        "11001",
      ]
    end

    test "returns a list filtered by most common bits at position 1" do
      bits = [
        "11110",
        "10110",
        "10111",
        "10101",
        "11100",
        "10000",
        "11001",
      ]

      assert Submarine.LifeSupport.filter_at_position(bits, 1) == [
        "10110",
        "10111",
        "10101",
        "10000",
      ]
    end

    test "returns list filtered with 1 as most common if there's a tie" do
      bits = [
        "10110",
        "10111",
      ]

      assert Submarine.LifeSupport.filter_at_position(bits, 4) == [
        "10111",
      ]
    end
  end

  describe "#get_oxygen_rating" do
    test "returns most common bit" do
      assert Submarine.LifeSupport.get_oxygen_rating(%{"0" => 2, "1" => 1}) == "0"
      assert Submarine.LifeSupport.get_oxygen_rating(%{"0" => 1, "1" => 2}) == "1"
      assert Submarine.LifeSupport.get_oxygen_rating(%{"0" => 3}) == "0"
      assert Submarine.LifeSupport.get_oxygen_rating(%{"1" => 2}) == "1"
    end

    test "returns 1 if there is a tie" do
      assert Submarine.LifeSupport.get_oxygen_rating(%{"0" => 1, "1" => 1}) == "1"
    end
  end

  defp with_example_txt(_context) do
    {:ok, [bits: Submarine.read_input("test/fixtures/day3example.txt")]}
  end
end
