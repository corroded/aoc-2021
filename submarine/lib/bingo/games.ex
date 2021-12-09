defmodule Submarine.Bingo.Games do
  def run(input) do
    [numbers | card_marks] = input

    card_marks
    |> Enum.chunk_every(5)
    |> Enum.map(fn x -> Submarine.Bingo.Card.new(x) end)

  end

  def get_winning_number(cards, numbers) do
   , 188} 
  end
end
