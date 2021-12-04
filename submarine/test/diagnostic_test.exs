defmodule SubmarineDiagnosticTest do
  use ExUnit.Case

  describe "#vertical_bits" do
    test "returns a list of the each of the elements of a list of list" do
      lists = [
        "1234",
        "abcd",
        "wxyz",
      ]

      assert Submarine.Diagnostic.vertical_bits(lists) == [
        ["1", "a", "w"],
        ["2", "b", "x"],
        ["3", "c", "y"],
        ["4", "d", "z"]
      ]
    end
  end

  describe "#gamma_rate" do
    setup [:with_example_txt]

    test "it returns the gamma bits in decimal", context do
      assert Submarine.Diagnostic.gamma_rate(context[:bits]) == 22
    end
  end

  describe "#gamma_rate_calc given the example" do
    setup [:with_example_txt]

    test "it returns 22 in binary", context do
      assert Submarine.Diagnostic.gamma_rate_calc(context[:bits]) == "10110"
    end
  end

  describe "#gamma_rate_calc" do
    test "returns most common bits transposed when column has full 0s" do
      bits = ["10000", "00011", "11000"]
      assert Submarine.Diagnostic.gamma_rate_calc(bits) == "10000"
    end

    test "returns most common bits transposed when column has full 1s" do
      bits = ["10001", "00011", "11001"]
      assert Submarine.Diagnostic.gamma_rate_calc(bits) == "10001"
    end
  end

  describe "#epsilon_rate" do
    setup [:with_example_txt]

    test "it returns the epsulon bits in decimal", context do
      assert Submarine.Diagnostic.epsilon_rate(context[:bits]) == 9
    end
  end

  describe "#epsilon_rate_calc given the example" do
    setup [:with_example_txt]

    test "it returns 9 in binary", context do
      assert Submarine.Diagnostic.epsilon_rate_calc(context[:bits]) == "01001"
    end
  end

  describe "#epsilon_rate_calc" do
    test "returns most common bits transposed when column has full 0s" do
      bits = ["10000", "00011", "11000"]
      assert Submarine.Diagnostic.epsilon_rate_calc(bits) == "01111"
    end

    test "returns most common bits transposed when column has full 1s" do
      bits = ["10001", "00011", "11001"]
      assert Submarine.Diagnostic.epsilon_rate_calc(bits) == "01110"
    end
  end

  defp with_example_txt(_context) do
    {:ok, [bits: Submarine.read_input("test/fixtures/day3example.txt")]}
  end
end
