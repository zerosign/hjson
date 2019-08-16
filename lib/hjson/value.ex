defmodule Hjson.Value do
  null = utf8_string("null")
  false_ = utf8_string("false")
  true_ = utf8_string("true")

  parser =
    choice([
      Hjson.String.parser, Hjson.Number.parser, Hjson.Object.parser,
      Hjson.Array.parser, true_, false_, null
    ])
end
