defmodule Hjson.Comment do
  import NimbleParsec

  single_line =
    utf8_string(["#", "//"])
    |> repeat(utf_char({:not, '\n'}))

  multiline =
    string("/*")
    |> repeat(utf_char({:not, "*/"}))
    |> string("*/")

  parser =
    choice([single_line, multiline])

  defparsec :parser, parser, inline: true, debug: true
end
