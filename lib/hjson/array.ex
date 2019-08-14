defmodule Hjson.Array do
  import NimbleParsec

  parser = empty()
  |> ascii_char('[')

end
