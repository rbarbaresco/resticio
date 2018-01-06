defmodule ResticioTest do
  use ExUnit.Case
  doctest Resticio

  test "greets the world" do
    assert Resticio.hello() == :world
  end
end
