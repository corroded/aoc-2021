defmodule SubmarineLineTest do
  use ExUnit.Case

  alias Submarine.Geometry.Point, as: Point

  describe "#draw" do
    test "vertical lines returns a list of points with the same ycoord" do
      points = [Point.new([0,9]), Point.new([5,9])]

      assert Submarine.Geometry.Line.draw(points) == [
        Point.new([0,9]),
        Point.new([1,9]),
        Point.new([2,9]),
        Point.new([3,9]),
        Point.new([4,9]),
        Point.new([5,9]),
      ]
    end

    test "horizontal_line returns a list of points with the same xcoord" do
      points = [Point.new([7,0]), Point.new([7,4])]

      assert Submarine.Geometry.Line.draw(points) == [
        Point.new([7,0]),
        Point.new([7,1]),
        Point.new([7,2]),
        Point.new([7,3]),
        Point.new([7,4]),
      ]
    end

    test "diagonal returns nil" do
      points = [Point.new([8,0]), Point.new([0,8])]

      assert Submarine.Geometry.Line.draw(points) == []
    end
  end

  describe "#vertical_line?" do
    test "returns true if ycoord is the same" do
      points = [
        Point.new([0,9]),
        Point.new([5,9]),
      ]

      assert Submarine.Geometry.Line.vertical_line?(points) == true
    end

    test "returns false if ycoord is not the same" do
      points = [
        Point.new([0,0]),
        Point.new([0,9]),
      ]

      assert Submarine.Geometry.Line.vertical_line?(points) == false
    end
  end

  describe "#horizontal_line?" do
    test "returns true if xcoord is the same" do
      points = [
        Point.new([0,2]),
        Point.new([0,1]),
      ]

      assert Submarine.Geometry.Line.horizontal_line?(points) == true
    end

    test "returns false if xcoord is not the same" do
      points = [
        Point.new([0,5]),
        Point.new([9,5]),
      ]

      assert Submarine.Geometry.Line.horizontal_line?(points) == false
    end
  end
end
