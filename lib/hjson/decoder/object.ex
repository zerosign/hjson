defmodule Hjson.Decoder.Member do
  import NimbleParsec

  quote_symbols = [',', ':', '[', ']', '{', '}']

  parser =
    choice([Hjson.String.json, utf8_char({:not, quote_symbols})])
    |> utf8_char(':')
    |> Hjson.Value.parser

  defparsec :parser, parser, inline: true, debug: true
end


defmodule Hjson.Decoder.Object do
  import NimbleParsec

  multi_objects = repeat(
    utf8_char(['\n', ','])
    |> Hjson.Member.parser
  )

  parser =
    utf8_char('{')
    |> Hjson.Member.parser
    |> optional(multi_objects)
    |> optional(utf8_char(','))
    |> utf8_char('}')

  defparsec :parser, parser, inline: true, debug: true
end
