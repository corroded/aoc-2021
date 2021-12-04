defmodule Submarine.Sonar do
  def sweep(filename) do
    depths = Submarine.read_input(filename)
      |> Enum.map(fn x -> String.to_integer(x) end)

    depths
      |> Enum.with_index()
      |> Enum.count(fn {_, i} ->
        Enum.at(depths, i) < Enum.at(depths, i + 1) && Enum.at(depths, i) != Enum.at(depths, -1)
    end)
  end
end
