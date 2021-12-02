defmodule Submarine do
  @moduledoc """
  Documentation for `Submarine`.
  """

  defstruct depth: 0, xpos: 0, aim: 0

  def new() do
    %Submarine{}
  end

  def new(depth, xpos, aim) do
    %Submarine{depth: depth, xpos: xpos, aim: aim}
  end

  def move_forward(submarine, pos) do
    IO.inspect submarine 
    %Submarine{ submarine | xpos: submarine.xpos + pos, depth: submarine.depth + (submarine.aim * pos) }
  end

  def move_up(submarine, pos) do
    %Submarine{ submarine | aim: submarine.aim - pos }
  end

  def move_down(submarine, pos) do
    %Submarine{ submarine | aim: submarine.aim + pos }
  end

  def move(submarine, movement) do
    case String.split(movement, " ") do
      ["forward", x] -> Submarine.move_forward(submarine, String.to_integer(x))
      ["up", x] -> Submarine.move_up(submarine, String.to_integer(x))
      ["down", x] -> Submarine.move_down(submarine, String.to_integer(x))
    end
  end
end

{:ok, contents} = File.read("movement.txt")

submarine = Submarine.new()

submarine = contents
 |> String.split("\n", trim: true)
 |> Enum.reduce(submarine, fn x, acc -> Submarine.move(acc, x) end)

IO.inspect(submarine.depth * submarine.xpos)
