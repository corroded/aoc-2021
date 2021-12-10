defmodule Submarine.Geometry.Line do
  defstruct points: [], start_point: nil, end_point: nil

  alias Submarine.Geometry.Point, as: Point

  def new(points) do
    %Submarine.Geometry.Line{points: points}
  end

  def draw(points) do
    [start_point | end_point] = points

    end_point = end_point |> List.first()

    cond do
      vertical_line?(start_point, end_point) ->
        start_point.xcoord..end_point.xcoord |> Enum.map(fn x -> Point.new([x, end_point.ycoord]) end)
      horizontal_line?(start_point, end_point) ->
        start_point.ycoord..end_point.ycoord |> Enum.map(fn x -> Point.new([start_point.xcoord, x]) end)
      positive_diagonal_line?(start_point, end_point) ->
        draw_45deg_line(start_point, end_point)
      negative_diagonal_line?(start_point, end_point) ->
        draw_45deg_line(start_point, end_point)
      true ->
        []
    end
  end

  def vertical_line?(start_point, end_point) do
    start_point.ycoord == end_point.ycoord
  end

  def horizontal_line?(start_point, end_point) do
    start_point.xcoord == end_point.xcoord
  end

  def positive_diagonal_line?(start_point, end_point) do
    ((end_point.ycoord - start_point.ycoord) / (end_point.xcoord - start_point.xcoord)) == -1
  end

  def negative_diagonal_line?(start_point, end_point) do
    ((end_point.ycoord - start_point.ycoord) / (end_point.xcoord - start_point.xcoord)) == 1
  end

  defp draw_45deg_line(start_point, end_point) do
    Enum.zip_with(
      start_point.xcoord..end_point.xcoord,
      start_point.ycoord..end_point.ycoord,
      fn x,y -> Point.new([x, y]) end
    )
  end
end
