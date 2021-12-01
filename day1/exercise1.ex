{:ok, contents} = File.read("input1.txt")

depths = 
  contents
  |> String.split("\n", trim: true)
  |> Enum.map(fn x -> String.to_integer(x) end)

depths
  |> Enum.with_index()
  |> Enum.count(fn {_, i} ->
    Enum.at(depths, i) < Enum.at(depths, i + 1) && Enum.at(depths, i) != Enum.at(depths, -1)
end)
  |> IO.puts()
