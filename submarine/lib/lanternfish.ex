defmodule Submarine.Lanternfish do
  def count(input, days) do
    input
    |> propagate(1, days)
    |> Enum.count()
  end

  def propagate(input, day, days) when day < days do
    input
    |> Enum.flat_map(fn x -> breed(x) end)
    |> propagate(day+1, days)
  end

  def propagate(input, day, days) when day == days do
    input
    |> Enum.flat_map(fn x -> breed(x) end)
  end

  defp breed(fish) do
    cond do
      fish >= 1 ->
        [fish - 1]
      fish == 0 ->
        [6,8]
      true ->
        {:error, "Should not happen"}
    end
  end
end
