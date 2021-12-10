defmodule SubmarineVentsTest do
  use ExUnit.Case

  describe "#count_intersections" do
    test "it returns the count of points intersecting" do
      lines = [
        "0,9",
        "1,9",
        "2,9",
        "3,9",
        "4,9",
        "5,9",
        "0,9",
        "1,9",
        "2,9",
      ]

      assert Submarine.Vents.count_intersections(lines) == 3
    end
  end

  describe "#draw_lines" do
    test "it creates a list of points" do
      line = ["0,9 -> 5,9", "0,9 -> 2,9"]

      assert Submarine.Vents.draw_lines(line) == [
        "0,9",
        "1,9",
        "2,9",
        "3,9",
        "4,9",
        "5,9",
        "0,9",
        "1,9",
        "2,9",
      ]
    end
  end
end
