defmodule Submarine.Geometry.Line do
  defstruct points: []

  def new(points) do
    %Submarine.Geometry.Line{points: points}
  end

  def vertical_line?(points) do
    (points |> Enum.map(fn x -> x.ycoord end) |> Enum.uniq() |> Enum.count()) == 1
  end

  def horizontal_line?(points) do
    (points |> Enum.map(fn x -> x.xcoord end) |> Enum.uniq() |> Enum.count()) == 1
  end
end
