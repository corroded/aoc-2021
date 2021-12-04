defmodule SubmarineSonarTest do
  use ExUnit.Case

  describe "#sweep" do
    assert Submarine.Sonar.sweep("test/fixtures/sweep_test.txt") == 7
  end
end
