
defmodule Submarine.SlidingWindow do
  def valid?([_,nil,nil]), do: false
  def valid?([_]), do: false
  def valid?([_,_,nil]), do: false
  def valid?([_,_]), do: false
  def valid?([_,_,_]), do: true
end
