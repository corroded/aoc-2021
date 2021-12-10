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

    test "non-45deg diagonal line" do
      points = [Point.new([9,0]), Point.new([5,1])]

      assert Submarine.Geometry.Line.draw(points) == []
    end

    test "45deg diagonal line" do
      points = [Point.new([8,0]), Point.new([0,8])]

      assert Submarine.Geometry.Line.draw(points) == [
        Point.new([8,0]),
        Point.new([7,1]),
        Point.new([6,2]),
        Point.new([5,3]),
        Point.new([4,4]),
        Point.new([3,5]),
        Point.new([2,6]),
        Point.new([1,7]),
        Point.new([0,8]),
      ]
    end

    test "-45deg diagonal line" do
      points = [Point.new([0,0]), Point.new([3,3])]

      assert Submarine.Geometry.Line.draw(points) == [
        Point.new([0,0]),
        Point.new([1,1]),
        Point.new([2,2]),
        Point.new([3,3]),
      ]
    end
  end

  describe "#vertical_line?" do
    test "returns true if ycoord is the same" do
      assert Submarine.Geometry.Line.vertical_line?(
        Point.new([0,9]),
        Point.new([5,9])
      ) == true
    end

    test "returns false if ycoord is not the same" do
      assert Submarine.Geometry.Line.vertical_line?(
        Point.new([0,0]),
        Point.new([0,9])
      ) == false
    end
  end

  describe "#horizontal_line?" do
    test "returns true if xcoord is the same" do
      assert Submarine.Geometry.Line.horizontal_line?(
        Point.new([0,2]),
        Point.new([0,1])
      ) == true
    end

    test "returns false if xcoord is not the same" do
      assert Submarine.Geometry.Line.horizontal_line?(
        Point.new([0,5]),
        Point.new([9,5])
      ) == false
    end
  end
end
