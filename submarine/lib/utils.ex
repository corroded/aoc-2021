
defmodule Submarine.Utils do
  def transpose(list) do
    list
      |> Enum.map(fn x -> String.split(x, "") |> Enum.reject(fn y -> y == "" end) end)
      |> List.zip
      |> Enum.map(&Tuple.to_list/1)
  end
end
