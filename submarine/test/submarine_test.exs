defmodule SubmarineTest do
  use ExUnit.Case
  doctest Submarine

  describe "#read_input" do
    assert Submarine.read_input("test.txt") == ["hello", "world"]
  end

  test "starts at 0 0" do
    submarine = %Submarine{}

    assert submarine.depth == 0
    assert submarine.xpos == 0
    assert submarine.aim == 0
  end

  describe "#move_forward" do
    test "increments xpos from default" do
      submarine = Submarine.new()

      submarine = Submarine.move_forward(submarine, 5)

      assert submarine.xpos == 5
      assert submarine.depth == 0
    end

    test "increments xpos BASED ON AIM from a different starting point" do
      submarine = Submarine.new(3, 4, 5) # depth, xpos, aim

      submarine = Submarine.move_forward(submarine, 2)

      assert submarine.depth == 13 # 3 + (5 * 2)
      assert submarine.xpos == 6
      assert submarine.aim == 5
    end
  end

  describe "#move_up" do
    test "DECREMENTS aim" do
      submarine = Submarine.new()

      submarine = Submarine.move_up(submarine, 3)

      assert submarine.xpos == 0
      assert submarine.depth == 0
      assert submarine.aim == -3
    end
  end

  describe "#move_down" do
    test "INCREMENTS aim" do
      submarine = Submarine.new()

      submarine = Submarine.move_down(submarine, 2)

      assert submarine.xpos == 0
      assert submarine.depth == 0
      assert submarine.aim == 2
    end
  end

  describe "#move" do
    test "move forward" do
      submarine = Submarine.new()

      submarine = Submarine.move(submarine, "forward 2")

      assert submarine.xpos == 2
      assert submarine.depth == 0
    end

    test "move up" do
      submarine = Submarine.new()

      submarine = Submarine.move(submarine, "up 3")

      assert submarine.depth == 0
      assert submarine.xpos == 0
      assert submarine.aim == -3
    end

    test "move down" do
      submarine = Submarine.new()

      submarine = Submarine.move(submarine, "down 5")

      assert submarine.depth == 0
      assert submarine.xpos == 0
      assert submarine.aim == 5
    end
  end
end
