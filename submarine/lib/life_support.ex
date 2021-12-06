defmodule Submarine.LifeSupport do
  def filter_at_position(bits, position, func) do
    filter = bits
      |> Submarine.Diagnostic.vertical_bits()
      |> Enum.at(position)
      |> Enum.frequencies()
      |> func.()

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

  def get_co2_rating(frequencies) do
    cond do
      Map.get(frequencies, "0") == nil ->
        "0"
      Map.get(frequencies, "1") == nil ->
        "1"
      Map.get(frequencies, "0") > Map.get(frequencies, "1") ->
        "1"
      true ->
        "0"
    end
  end

  def co2_scrubber_rating(bits) do
    co2_scrubber_rating(bits, 0)
  end

  def co2_scrubber_rating(bits, _) when length(bits) == 1 do
    bits
      |> Enum.at(0)
      |> String.to_integer(2)
  end

  def co2_scrubber_rating(bits, index) when length(bits) > 1 do
    bits
      |> filter_at_position(index, &get_co2_rating/1)
      |> co2_scrubber_rating(index + 1)
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
      |> filter_at_position(index, &get_oxygen_rating/1)
      |> oxygen_generator_rating(index + 1)
  end
end
