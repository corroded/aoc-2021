defmodule SubmarineSonarTest do
  use ExUnit.Case

  describe "#sweep" do
    assert Submarine.Sonar.sweep("test/fixtures/sweep_test.txt") == 7
  end

  describe "#sliding_sweep" do
    assert Submarine.Sonar.sliding_sweep("test/fixtures/sweep_test.txt") == 5
  end
end
