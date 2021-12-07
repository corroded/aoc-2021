
defmodule Submarine.Utils do
  def transpose(list) do
    transpose(list, "")
  end

  def transpose(list, delimeter) do
    list
      |> Enum.map(fn x -> String.split(x, delimeter, trim: true) end)
      |> List.zip
      |> Enum.map(&Tuple.to_list/1)
  end
end
