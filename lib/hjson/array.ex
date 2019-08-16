defmodule Hjson.Array do
  import NimbleParsec

  multiple_value =
    repeat(
      utf8_char([',', '\n'])
      |> Hjson.Value.parser
    )

  inner =
    Hjson.Value.parser
    |> optional(multiple_value)
    |> optional(utf8_char(','))

  parser = empty()
  |> utf8_char('[')
  |> optional(inner)
  |> utf8_char(']')

  defparsec :parser, parser, inline: true, debug: true
end
