defmodule HjsonTest do
  use ExUnit.Case
  doctest Hjson

  test "greets the world" do
    assert Hjson.hello() == :world
  end
end
