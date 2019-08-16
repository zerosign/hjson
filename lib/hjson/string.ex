defmodule Hjson.String do
  import NimbleParsec

  quote_symbols = [',', ':', '[', ']', '{', '}']

  escaped_symbols = ['"', '\'', '\\', '/', 'b', 'f', 'n', 'r', 't']

  quoteless =
    utf8_char({:not, quote_symbols}, min: 1)
    |> optional(repeat(utf8_char({:not, '\n'})))

  multi_quote = "'''"

  # TODO: @zerosign
  hexadecimal =
    empty()

  multiline =
    utf8_string(multi_quote)
    |> utf8_string({:not, multi_quote})
    |> utf8_string(multi_quote)

  escaped_str =
    utf8_char('\\')
    |> choice([utf8_char(escaped_symbols), concat([utf8_char('u'), hexadecimal])])

  json_single_quote =
    utf8_char("\"")
    |> choice([utf8_string({:not, ["\"", "\\"]}), escaped_str])
    |> utf8_char("\"")

  json_multi_quote =
    utf8_char("\"")
    |> choice([utf8_string({:not, ["'", "\\"]}), escaped_str])
    |> utf8_char("\"")

  json = choice([json_single_quote, json_multi_quote])

  parser = empty()
  |> choice([quoteless, multiline, json])

  defparsec :parser, parser, inline: true, debug: true

end
