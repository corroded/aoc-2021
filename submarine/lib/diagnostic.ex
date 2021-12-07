
defmodule Submarine.Diagnostic do
  def gamma_rate_calc(bits) do
    bits
      |> Submarine.Utils.transpose()
      |> Enum.map(fn x -> Enum.frequencies(x) end)
      |> Enum.map(fn x ->
        cond do
          Map.get(x, "0") == nil ->
            "1"
          Map.get(x, "1") == nil ->
            "0"
          Map.get(x, "0") > Map.get(x, "1") ->
            "0"
          true ->
            "1"
        end
      end)
      |> Enum.join()
  end

  def epsilon_rate_calc(bits) do
    bits
      |> Submarine.Utils.transpose()
      |> Enum.map(fn x -> Enum.frequencies(x) end)
      |> Enum.map(fn x ->
        cond do
          Map.get(x, "0") == nil ->
            "0"
          Map.get(x, "1") == nil ->
            "1"
          Map.get(x, "0") > Map.get(x, "1") ->
            "1"
          true ->
            "0"
        end
      end)
      |> Enum.join()
  end

  def gamma_rate(bits) do
    gamma_rate_calc(bits) |> String.to_integer(2)
  end

  def epsilon_rate(bits) do
    epsilon_rate_calc(bits) |> String.to_integer(2)
  end
end
