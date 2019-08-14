defmodule Hjson.Member do
  import NimbleParsec

  quote_symbols = [',', ':', '[', ']', '{', '}']

  parser =
    choice([Hjson.String.json, utf8_char({:not, quote_symbols})])
    |> utf8_char(':')
    |> Hjson.Value.parser

end


defmodule Hjson.Object do
  import NimbleParsec

  parser =
  utf8_char('{')

end
