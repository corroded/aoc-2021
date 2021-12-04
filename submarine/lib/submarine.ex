defmodule Submarine do
  @moduledoc """
  Documentation for `Submarine`.
  """

  def read_input(filename) do
    {:ok, contents} = File.read(filename)

    contents |> String.split("\n", trim: true)
  end
end
