defmodule Hjson.Decoder.Comment do
  import NimbleParsec

  single_line =
    utf8_char(["#", "//"])
    |> repeat(utf8_char({:not, '\n'}))

  multiline =
    string("/*")
    |> repeat(utf8_char({:not, "*/"}))
    |> string("*/")

  parser =
    choice([single_line, multiline])

  defparsec :parser, parser, inline: true, debug: true
end
