defmodule Submarine.Bingo.Games do
  def run(input) do
    [numbers | card_marks] = input

    number_list = numbers |> String.split(",", trim: true)

    card_marks
    |> Enum.chunk_every(5)
    |> Enum.map(fn x -> Submarine.Bingo.Card.new(x) end)
    |> Submarine.Bingo.Games.get_winning_number(number_list)
  end

  def get_winning_number(cards, numbers, index) when index < length(numbers) do
    portion = numbers |> Enum.slice(0..index)
    number_string = portion |> Enum.join(",")

    winning_card = cards
      |> Enum.find(
        fn x -> Submarine.Bingo.Card.winning?(x, number_string)
      end)

    if winning_card do
      (numbers |> Enum.at(index) |> String.to_integer()) * Submarine.Bingo.Card.unmarked_total(winning_card, number_string)
    else
      get_winning_number(cards, numbers, index+1)
    end
  end

  @spec get_winning_number(any, list) :: any
  def get_winning_number(cards, numbers) do
    get_winning_number(cards, numbers, 0)
  end

  def get_winning_number(cards, numbers, index) when length(numbers) == index do
    IO.puts("something must have gone wrong or the last number is the winning number")
  end
end
