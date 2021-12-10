defmodule Submarine.Vents do
  alias Submarine.Geometry.Point, as: Point
  alias Submarine.Geometry.Line, as: Line

  def draw_lines(lines) do
    lines
    |> Enum.flat_map(fn x -> 
      String.split(x, " -> ", trim: true)
      |> draw_points()
      |> Line.draw()
    end)
    |> Enum.map(&Point.to_s/1)
  end

  def count_intersections(lines) do
    lines
    |> Enum.frequencies()
    |> Map.values()
    |> Enum.count(fn x -> x > 1 end)
  end

  defp draw_points(points) do
    [head | tail] = points

    [
      Point.new(head |> String.split(",", trim: true) |> Enum.map(&String.to_integer/1)),
      Point.new(tail |> List.first() |> String.split(",", trim: true) |> Enum.map(&String.to_integer/1)),
    ]
  end
end
