defmodule Submarine.Geometry.Line do
  defstruct points: []

  alias Submarine.Geometry.Point, as: Point

  def new(points) do
    %Submarine.Geometry.Line{points: points}
  end

  def draw(points) do
    [start_point | end_point] = points

    end_point = end_point |> List.first()

    cond do
      vertical_line?(points) ->
        start_point.xcoord..end_point.xcoord |> Enum.map(fn x -> Point.new([x, end_point.ycoord]) end)
      horizontal_line?(points) ->
        start_point.ycoord..end_point.ycoord |> Enum.map(fn x -> Point.new([start_point.xcoord, x]) end)
      true ->
        []
    end
  end

  def vertical_line?(points) do
    (points |> Enum.map(fn x -> x.ycoord end) |> Enum.uniq() |> Enum.count()) == 1
  end

  def horizontal_line?(points) do
    (points |> Enum.map(fn x -> x.xcoord end) |> Enum.uniq() |> Enum.count()) == 1
  end
end
