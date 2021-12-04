defmodule Submarine.Sonar do
  def sweep(filename) do
    depths =
      Submarine.read_input(filename)
      |> Enum.map(fn x -> String.to_integer(x) end)

    depths
      |> Enum.with_index()
      |> Enum.count(fn {_, i} ->
        Enum.at(depths, i) < Enum.at(depths, i + 1) && Enum.at(depths, i) != Enum.at(depths, -1)
      end)
  end

  def sliding_sweep(filename) do
    depths =
      Submarine.read_input(filename)
      |> Enum.map(fn x -> String.to_integer(x) end)

    sliding_depths = depths
      |> Enum.with_index()
      |> Enum.map(fn {_, i} ->
        window = Enum.slice(depths, i..(i + 2))

        if Submarine.SlidingWindow.valid?(window) do
          Enum.sum(window)
        end
      end)
      |> Enum.reject(&is_nil/1)

    sliding_depths
      |> Enum.with_index()
      |> Enum.count(fn {_, i} ->
        Enum.at(sliding_depths, i) < Enum.at(sliding_depths, i + 1) && Enum.at(sliding_depths, i) != Enum.at(sliding_depths, -1)
      end)
  end
end
