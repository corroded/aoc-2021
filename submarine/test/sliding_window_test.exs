defmodule SubmarineSlidingWindowTest do
  use ExUnit.Case

  describe "#valid?" do
    assert Submarine.SlidingWindow.valid?([1,2,3]) == true
    assert Submarine.SlidingWindow.valid?([1,nil,nil]) == false
    assert Submarine.SlidingWindow.valid?([2,nil]) == false
    assert Submarine.SlidingWindow.valid?([1,4]) == false
    assert Submarine.SlidingWindow.valid?([5]) == false
  end
end
