defmodule SubmarineTest do
  use ExUnit.Case
  doctest Submarine

  test "starts at 0 0" do
    submarine = %Submarine{}

    assert submarine.depth == 0
    assert submarine.xpos == 0
  end

  describe "#move_forward" do
    test "increments xpos from default" do
      submarine = Submarine.new()

      submarine = Submarine.move_forward(submarine, 5)

      assert submarine.xpos == 5
      assert submarine.depth == 0
    end

    test "increments xpos from a different starting point" do
      submarine = Submarine.new(3, 4)

      IO.inspect submarine

      submarine = Submarine.move_forward(submarine, 6)

      assert submarine.xpos == 10
      assert submarine.depth == 3
    end
  end

  describe "#move_up" do
    test "DECREMENTS depth from default" do
      submarine = Submarine.new()

      submarine = Submarine.move_up(submarine, 3)

      assert submarine.xpos == 0
      assert submarine.depth == -3
    end
  end

  describe "#move_down" do
    test "INCREMENTS depth from default" do
      submarine = Submarine.new()

      submarine = Submarine.move_down(submarine, 2)

      assert submarine.xpos == 0
      assert submarine.depth == 2
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

      assert submarine.xpos == 0
      assert submarine.depth == -3
    end

    test "move down" do
      submarine = Submarine.new()

      submarine = Submarine.move(submarine, "down 5")

      assert submarine.xpos == 0
      assert submarine.depth == 5
    end
  end
end
