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
    matcher = numbers
    |> String.split(",", trim: true)

    card.marks
    |> Enum.any?(fn x -> (x -- matcher) == [] end)
  end

  def unmarked_total(card, numbers) do
    matcher = numbers |> String.split(",", trim: true)

    unmarked_marks = card.marks
      |> Enum.flat_map(& &1)
      |> Enum.uniq()

    (unmarked_marks -- matcher)
      |> Enum.map(&String.to_integer/1)
      |> Enum.sum()
  end
end
