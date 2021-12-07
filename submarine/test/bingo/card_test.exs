defmodule SubmarineBingoCardTest do
  use ExUnit.Case

  describe "Card" do
    setup [:sample_bingo_card]

    test "it cleans and keeps the marks for reference", context do
      card = Submarine.Bingo.Card.new(context[:marks])

      assert card.marks == [
        ["22", "13", "17", "11", "0"],
        ["8", "2", "23", "4", "24"],
        ["21", "9", "14", "16", "7"],
        ["6", "10", "3", "18", "5"],
        ["1", "12", "20", "15", "19"],
        ["22", "8", "21", "6", "1"],
        ["13", "2", "9", "10", "12"],
        ["17", "23", "14", "3", "20"],
        ["11", "4", "16", "18", "15"],
        ["0", "24", "7", "5", "19"],
      ]
    end
  end

  describe "#winning?" do
    setup [:sample_bingo_card]

    test "it is true when one of the horizontal rows has a bingo match", context do
      numbers = "22,13,17,11,0"

      card = Submarine.Bingo.Card.new(context[:marks])

      assert Submarine.Bingo.Card.winning?(card, numbers) == true
    end

    test "it is false when no horizontal row matches", context do
      numbers = "22,13,17,11,1"

      card = Submarine.Bingo.Card.new(context[:marks])

      assert Submarine.Bingo.Card.winning?(card, numbers) == false
    end

    test "it is true even if it is not in order", context do
      numbers = "0,22,13,17,11"

      card = Submarine.Bingo.Card.new(context[:marks])

      assert Submarine.Bingo.Card.winning?(card, numbers) == true
    end

    test "it is true for vertical matches", context do
      numbers = "17,23,3,14,20"

      card = Submarine.Bingo.Card.new(context[:marks])

      assert Submarine.Bingo.Card.winning?(card, numbers) == true
    end

    test "it is true even if there are numbers in between", context do
      numbers = "17,23,4,10,3,14,20"

      card = Submarine.Bingo.Card.new(context[:marks])
      assert Submarine.Bingo.Card.winning?(card, numbers) == true

      more_numbers = "0,3,14,10,6,18,12,5"

      assert Submarine.Bingo.Card.winning?(card, more_numbers) == true
    end
  end

  describe "#unmarked_total" do
    setup [:winning_card]

    test "it sums the value of the unmarked numbers of a winning card", context do
      numbers = "7,4,9,5,11,17,23,2,0,14,21,24"

      card = Submarine.Bingo.Card.new(context[:marks])
      assert Submarine.Bingo.Card.unmarked_total(card, numbers) == 188
    end
  end

  defp sample_bingo_card(_) do
    {:ok, [marks: [
      "22 13 17 11  0",
      " 8  2 23  4 24",
      "21  9 14 16  7",
      " 6 10  3 18  5",
      " 1 12 20 15 19",
    ]]}
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
