defmodule Hjson.Number do
  import NimbleParsec

  non_zero_digit =
    utf8_char([?1..?9])

  zero =
    utf8_char('0')

  digit =
    utf8_char([?0..?9])

  non_zero_integer =
    repeat(concat([non_zero_digit, optional(repeat(digit))]))

  fraction =
    utf8_char('.')
    |> repeat(digit)

  signed =
    utf8_char([?+, ?-])

  exponent =
    utf8_char([?e, ?E])

  parser =
    optional(utf8_char('-'))
    |> choice([zero, non_zero_integer])
    |> optional(fraction)
    |> optional(concat([exponent, optional(signed), repeat(digit)]))

  defparsec :parser, parser, inline: true, debug: true
end
