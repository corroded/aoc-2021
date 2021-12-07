defmodule Submarine.Bingo.Card do
  defstruct marks: []

  def new() do
    %Submarine.Bingo.Card{}
  end

  def new(marks) do
    %Submarine.Bingo.Card{
      marks: marks
      |> Enum.map(fn x -> String.split(x, " ", trim: true) end)
      |> Enum.concat(Submarine.Utils.transpose(marks, " "))
    }
  end

  def winning?(card, numbers) do

  end
end
