{:ok, contents} = File.read("input1.txt")

# depths = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
depths = contents |> String.split("\n", trim: true) |> Enum.map(fn x -> String.to_integer(x) end)

defmodule SlidingWindow do
  def valid?([_,nil,nil]), do: false
  def valid?([_]), do: false
  def valid?([_,_,nil]), do: false
  def valid?([_,_]), do: false
  def valid?([_,_,_]), do: true
end

sliding_depths = depths
  |> Enum.with_index()
  |> Enum.map(fn {_,i} ->
    window = Enum.slice(depths, i..i+2)
    if SlidingWindow.valid?(window) do
      Enum.sum(window)
    end
  end)
  |> Enum.reject(&is_nil/1)
  |> IO.inspect()
    
sliding_depths
  |> Enum.with_index()
  |> Enum.count(fn {_, i} ->
    Enum.at(sliding_depths, i) < Enum.at(sliding_depths, i + 1) && Enum.at(sliding_depths, i) != Enum.at(sliding_depths, -1)
   end)
  |> IO.puts()

