defmodule Hjson.String do
  import NimbleParsec

  quote_symbols = [',', ':', '[', ']', '{', '}']

  quoteless =
    utf8_char({:not, quote_symbols}, min: 1)
    |> optional(repeat(utf8_char({:not, '\n'})))

  multi_quote = "'''"

  multiline =
    utf8_string(multi_quote)
    |> utf8_string({:not, multi_quote})
    |> utf8_string(multi_quote)

  # TODO: @zerosign
  json =
    utf8_char([?", ?'])

  parser = empty()
  |> choice([quoteless, multiline, json])

  defparsec :parser, parser, inline: true, debug: true

end
