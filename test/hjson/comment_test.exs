defmodule Hjson.CommentTest do
  use ExUnit.Case, async: true
  doctest Hjson.Comment

  import NimbleParsec

  describe "parse single line comment" do
    @doc """

    """
    defparsec :parse_single_line, Hjson.Comment.single_line

    test "returns ok/error" do

    end
  end

  describe "parse multiple line comments" do
    @doc """

    """
    defparsec :parse_multiple_line, Hjson.Comment.multiline

    test "returns ok/error" do

    end
  end

  test "full test comments" do

  end
end
