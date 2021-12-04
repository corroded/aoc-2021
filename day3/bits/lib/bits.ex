defmodule Bits do
  @moduledoc """
  Documentation for `Bits`.
  """

  defstruct gamma_rate: 0, epsilon_rate: 0

  @bit_length = 12

  def new(bits) do
    %Bit{gamma_rate: 0, epsilon_rate: 0}
  end

  def gamma_rate_calc(bits, bit_length) do
    bits |> Enum.map(fn x -> String.at(x, 0) end) |> Enum.frequencies() |> Map.values()
  end

  def gamma_rate_calc(bits) do
    # gamma_rate(bits, @bit_length)
    [head | tail] = bits
  end

  def epsilon_rate_calc(bits) do
    :world
  end

  def power_consumption(bits) do
    :world
  end
end
