defmodule SubmarineBingoGamesTest do
  use ExUnit.Case

  describe "run" do
    setup [:day4_example]

    test "it returns final score", context do
      assert Submarine.Bingo.Games.run(context[:input]) == 4512
    end
  end

  describe "#get_winning_number" do
    setup [:winning_card]

    test "it returns the winning number", context do
      numbers = "7,4,9,5,11,17,23,2,0,14,21,24,10,16" |> String.split(",", trim: true)

      card = Submarine.Bingo.Card.new(context[:marks])

      assert Submarine.Bingo.Games.get_winning_number([card], numbers) == 4512
    end
  end

  defp day4_example(_) do
    {:ok, [input: Submarine.read_input("test/fixtures/day4.txt")]}
  end

  defp winning_card(_) do
    {:ok, [marks: [
      "14 21 17 24  4",
      "10 16 15  9 19",
      "18  8 23 26 20",
      "22 11 13  6  5",
      " 2  0 12  3  7"
    ]]}
  end
end
