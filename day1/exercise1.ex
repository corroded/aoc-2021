# example_depths = [199 200, 208, 210, 200, 207, 240, 269, 260, 263]

{:ok, contents} =  File.read("input1.txt")

depths = contents |> String.split("\n", trim: true) |> Enum.map(fn x -> String.to_integer(x) end)

final_count = depths |> Enum.with_index |> Enum.map(fn({x,i}) -> Enum.at(depths, i) < Enum.at(depths, i+1) && Enum.at(depths, i) != Enum.at(depths, -1
) end)|> Enum.count(fn y -> y == true end)

IO.puts final_count
