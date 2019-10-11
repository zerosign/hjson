defmodule Hjson.Decoder.Value do
  import NimbleParsec

  null = string("null")
  false_ = string("false")
  true_ = string("true")

  parser =
    choice([
      Hjson.String.parser, Hjson.Number.parser, Hjson.Object.parser,
      Hjson.Array.parser, true_, false_, null
    ])
end
