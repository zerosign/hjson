defmodule Hjson.Comment do
  import NimbleParsec

  single_line =
    empty()
    |> choice([ascii_char('#'), string("//")])
    |> repeat(utf_char({:not, '\n'}))

  multiline =
    empty()
    |> string("/*")
    |> repeat(utf_char({:not, "*/"}))
    |> string("*/")

  parser =
    empty()
    |> choice([single_line, multiline])

  defparsec :parser, parser, inline: true, debug: true
end
