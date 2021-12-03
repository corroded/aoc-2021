defmodule BitsTest do
  use ExUnit.Case
  doctest Bits

  describe "example" do
    sample = [
      "00100",
      "11110",
      "10110",
      "10111",
      "10101",
      "01111",
      "00111",
      "11100",
      "10000",
      "11001",
      "00010",
      "01010"
    ]

    assert Bits.gamma_rate(sample, 5) == 10110
    assert Bits.epsilon_rate(sample) == 01001

    assert Bits.power_consumption(sample) == 198
  end
end
