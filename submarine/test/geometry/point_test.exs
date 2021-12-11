defmodule SubmarinePointTest do
  use ExUnit.Case

  alias Submarine.Geometry.Point, as: Point

  describe "#to_s" do
    test "it returns it back to a string" do
      assert Point.to_s(Point.new([0,9])) == "0,9"
    end
  end
end
