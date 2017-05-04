defmodule Hjson.Decode do
  # TODO
end

defprotocol Hjson.Decoder do

  @fallback_to_any true

  def decode(value, options)
end

defimpl Hjson.Decoder, for: Any do
  def decode(value, _options) do
    value
  end
end
