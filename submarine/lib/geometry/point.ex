defmodule Submarine.Geometry.Point do
  defstruct xcoord: 0, ycoord: 0

  def new(points) do
    [x|y] = points

    %Submarine.Geometry.Point{xcoord: x, ycoord: y |> List.first()}
  end

  def to_s(point) do
    [point.xcoord, point.ycoord] |> Enum.join(",")
  end
end
