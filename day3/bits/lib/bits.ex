defmodule Bits do
  @moduledoc """
  Documentation for `Bits`.
  """

  @bit_length = 12

  def gamma_rate(bits, bit_length) do
    bits |> Enum.map(fn x -> String.at(x, 0) end) |> Enum.frequencies() |> Map.values()
  end

  def gamma_rate(bits) do
    # gamma_rate(bits, @bit_length)
    [head | tail] = bits
  end

  def epsilon_rate(bits) do
    :world
  end

  def power_consumption(bits) do
    :world
  end
end
