defmodule Submarine.LifeSupport do
  def filter_at_position(bits, position) do
    filter = bits
      |> Submarine.Diagnostic.vertical_bits()
      |> Enum.at(position)
      |> Enum.frequencies()
      |> get_oxygen_rating()

    bits
      |> Enum.filter(fn x -> String.at(x, position) == filter end)
  end

  def get_oxygen_rating(frequencies) do
    cond do
      Map.get(frequencies, "0") == nil ->
        "1"
      Map.get(frequencies, "1") == nil ->
        "0"
      Map.get(frequencies, "0") > Map.get(frequencies, "1") ->
        "0"
      true ->
        "1"
    end
  end

  def oxygen_generator_rating(bits) do
    oxygen_generator_rating(bits, 0)
  end

  def oxygen_generator_rating(bits, _) when length(bits) == 1 do
    bits
      |> Enum.at(0)
      |> String.to_integer(2)
  end

  def oxygen_generator_rating(bits, index) when length(bits) > 1 do
    bits
      |> filter_at_position(index)
      |> oxygen_generator_rating(index + 1)
  end
end
