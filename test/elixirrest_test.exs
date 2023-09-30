defmodule ElixirrestTest do
  use ExUnit.Case
  doctest Elixirrest

  test "greets the world" do
    assert Elixirrest.hello() == :world
  end
end
